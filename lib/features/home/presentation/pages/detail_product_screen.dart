import 'package:ecommerce_app/config/constants/variables.dart';
import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/features/home/data/model/responses/products_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme.dart';
import '../../../cart/presentation/pages/cart_screen.dart';

class DetailProductScreen extends StatefulWidget {
  final Product product;
  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor1,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: 44,
                  width: 44,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      )),
                ),
                Text(
                  'Sneaker Shop',
                  style: ralewayFont16semiBold,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: whiteColor),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const CartScreen();
                              },
                            ));
                          },
                          icon: SvgPicture.asset('assets/icons/bag-2.svg'),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: dangerColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.product.attributes.name,
              style: ralewayFont26Bold,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Men\'s Shoes',
              style: ralewayFont16w500,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(int.parse(widget.product.attributes.price).currencyFormatRp,
                style: poppinsFont24semiBold),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 130,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('assets/images/Slider.png')),
                  ],
                ),
                Center(
                  child: Image.network(
                    '${Variables.baseUrl}${widget.product.attributes.images.data.first.attributes.url}',
                    height: 170,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                variantProduct(
                    '${Variables.baseUrl}${widget.product.attributes.images.data.first.attributes.url}'),
                // variantProduct('assets/images/nike-1.png'),
                // variantProduct('assets/images/nike-2.png'),
                // variantProduct('assets/images/nike-3.png'),
                // variantProduct('assets/images/nike-4.png'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${widget.product.attributes.name}\n\nDescription Product:\n${widget.product.attributes.description}',
              style: poppinsFont14w500,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Read More',
                  style: poppinsFontCustom(color: primaryColor, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: 52,
                  width: 52,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/heart.svg')),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 210,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bag-2.svg',
                            color: whiteColor,
                          ),
                          Text(
                            'Add To Cart',
                            style: ralewayFont14w600,
                          )
                        ]),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Container variantProduct(String variant) {
    return Container(
      margin: const EdgeInsets.only(left: 6, right: 6),
      height: 56,
      width: 56,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(16)),
      child: Image.network(variant),
    );
  }
}
