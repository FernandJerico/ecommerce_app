import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor1,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Column(
              children: [
                buildAppBar(context),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(
                      left: 20, right: 40, top: 15, bottom: 20),
                  height: 460,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: ralewayFont14w600Dark,
                        ),
                        buildContactInformation('assets/icons/chat.svg',
                            'loremipsum@gmail.com', 'Email'),
                        buildContactInformation('assets/icons/call.svg',
                            '+62821-39-488-953', 'Phone'),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Address',
                          style: ralewayFont14w600Dark,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rungkut, Kota Surabaya, Jawa Timur',
                              style: poppinsFont12w500,
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/Map.png',
                          height: 101,
                          width: 295,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Payment Method',
                          style: ralewayFont14w600Dark,
                        ),
                        buildPaymentMethod('assets/images/mandiri.png',
                            'Fernand Jerico', '**** **** 0696 4629'),
                      ]),
                )
              ],
            ),
          ),
          buildPositionedBottomCheckout(
            context,
            () {
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
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: buildButton(context, 'Back To Shopping', () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      )),
    );
  }
}
