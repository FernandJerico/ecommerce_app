import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/space_height.dart';
import '../../../cart/data/model/response/buyer_order_response_model.dart';

class OrderProductTile extends StatelessWidget {
  final Item data;
  const OrderProductTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: greyColor2),
      ),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          //   child: Image.asset(
          //     data.imagePath,
          //     width: 72.0,
          //     height: 72.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SpaceWidth(12.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.productName} (${data.qty} Item)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpaceHeight(20.0),
                Text(
                  data.price.currencyFormatRp,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
