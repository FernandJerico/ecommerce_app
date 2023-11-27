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
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Text(
                          '0 Item',
                          style: poppinsFont16w500,
                        );
                      },
                      loaded: (carts) {
                        int totalQty = 0;
                        for (var cart in carts) {
                          totalQty += cart.qty;
                        }
                        return Text(
                          '$totalQty Item',
                          style: poppinsFont16w500,
                        );
                      },
                    );
                  },
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
          buildPositionedBottomCartCheckout(
            context,
            () => Navigator.pushNamed(context, AppRoutes.checkout),
          )
        ],
      )),
    );
  }
}
