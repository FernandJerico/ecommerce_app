import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor1,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(context),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '1 Item',
                  style: poppinsFont16w500,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Center(
                            child:
                                CircularProgressIndicator(color: primaryColor),
                          );
                        },
                        loaded: (carts) {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15,
                            ),
                            itemCount: carts.length,
                            itemBuilder: (context, index) {
                              final item = carts[index];
                              return ListProductCart(item: item);
                            },
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          buildPositionedBottomCheckout(
            context,
            () => Navigator.pushNamed(context, AppRoutes.checkout),
          )
        ],
      )),
    );
  }
}
