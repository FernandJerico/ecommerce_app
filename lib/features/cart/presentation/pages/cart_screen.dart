import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';
import '../../data/model/cart_model.dart';
import '../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> cartList = [
    Cart(
      imagePath: 'assets/images/nike-jordan.png',
      name: 'Nike Jordan',
      price: 302000,
      qty: 1,
    ),
    Cart(
      imagePath: 'assets/images/nike-air-max.png',
      name: 'Nike Air Max',
      price: 752000,
      qty: 1,
    ),
    Cart(
      imagePath: 'assets/images/nike-2.png',
      name: 'Nike Air Max 270 Essential',
      price: 799000,
      qty: 1,
    ),
  ];

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
                  '${cartList.length.toString()} Item',
                  style: poppinsFont16w500,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final item = cartList[index];
                      return buildListProductCart(item);
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
