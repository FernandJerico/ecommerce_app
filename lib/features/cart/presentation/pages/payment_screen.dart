// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:ecommerce_app/features/cart/presentation/bloc/order_detail/order_detail_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../../../auth/presentation/widgets/auth_widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required this.invoiceUrl,
    required this.orderId,
  }) : super(key: key);
  final String invoiceUrl;
  final String orderId;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewController? _controller;
  Timer? _timer;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl));
    const oneSec = Duration(seconds: 4);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      //do check payment status here
      //if status is success, navigate to success page
      context
          .read<OrderDetailBloc>()
          .add(OrderDetailEvent.getOrderDetail(widget.orderId));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //call check status every 5 seconds with timer

    return Scaffold(
      body: BlocListener<OrderDetailBloc, OrderDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (order) {
              if (order.data.attributes.status == 'packaging') {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 134,
                              width: 134,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: const Color(0xffDFEFFF)),
                              child: Padding(
                                  padding: const EdgeInsets.all(25),
                                  child:
                                      Image.asset('assets/images/horaayy.png')),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Your Payment Is Successful',
                              style: ralewayFont21semiBold,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child:
                                  buildButton(context, 'Back To Shopping', () {
                                Navigator.pop(context);
                              }),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (order.data.attributes.status == 'failed') {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment Failed'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          );
        },
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
