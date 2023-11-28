import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/cart/data/model/response/buyer_order_response_model.dart';
import 'package:ecommerce_app/features/order/presentation/pages/order_detail_screen.dart';
import 'package:ecommerce_app/features/order/presentation/pages/manifest_delivery_screen.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/button.dart';
import '../../../../config/components/row_text.dart';
import '../../../../config/components/space_height.dart';

class OrderCard extends StatelessWidget {
  final BuyerOrder data;
  const OrderCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetailScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: greyColor),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NO RESI: ${data.attributes.noResi}',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Button.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManifestDeliveryScreen(
                                buyerOrder: data,
                              )),
                    );
                  },
                  label: 'Lacak',
                  height: 20.0,
                  width: 94.0,
                  fontSize: 11.0,
                ),
              ],
            ),
            const SpaceHeight(24.0),
            RowText(label: 'Status', value: data.attributes.status),
            const SpaceHeight(12.0),
            // RowText(label: 'Item', value: data.item),
            const SpaceHeight(12.0),
            RowText(
                label: 'Harga',
                value: data.attributes.totalPrice.currencyFormatRp),
          ],
        ),
      ),
    );
  }
}
