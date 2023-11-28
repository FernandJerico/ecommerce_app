import 'package:ecommerce_app/config/extensions/date_time_ext.dart';
import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/cart/data/model/response/buyer_order_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/row_text.dart';
import '../../../../config/components/space_height.dart';
import '../../data/models/order_product_model.dart';
import '../widgets/order_product_tile.dart';
import '../widgets/order_status.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.buyerOrder});
  final BuyerOrder buyerOrder;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final List<OrderProductModel> products = [
    OrderProductModel(
      imagePath: 'assets/images/nike-air-max.png',
      name: 'Sepatu Nike Air Max',
      price: 200000,
    ),
    OrderProductModel(
      imagePath: 'assets/images/nike-jordan.png',
      name: 'Sepatu Nike Jordan',
      price: 199999,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int totalItem = 0;
    int item = 0;
    for (var element in widget.buyerOrder.attributes.items) {
      totalItem += element.qty * element.price;
      item += element.qty;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const OrderStatus(
            status: ['Pending', 'Dikemas', 'Dikirim'],
          ),
          const SpaceHeight(24.0),
          const Text(
            'Produk',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.buyerOrder.attributes.items.length,
            itemBuilder: (context, index) => OrderProductTile(
              data: widget.buyerOrder.attributes.items[index],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pengiriman',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: greyColor2),
            ),
            child: Column(
              children: [
                RowText(
                  label: 'Waktu Pengiriman',
                  value: widget.buyerOrder.attributes.createdAt
                      .toFormattedDateWithDay(),
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ekspedisi Pengiriman',
                  value: widget.buyerOrder.attributes.courierName,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'No. Resi',
                  value: widget.buyerOrder.attributes.noResi,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Alamat',
                  value: widget.buyerOrder.attributes.deliveryAddress,
                ),
              ],
            ),
          ),
          const SpaceHeight(24.0),
          const Text(
            'Detail Pembayaran',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SpaceHeight(14.0),
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: greyColor2),
            ),
            child: Column(
              children: [
                RowText(
                  label: 'Total Item ($item)',
                  value: totalItem.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ongkir',
                  value: widget
                      .buyerOrder.attributes.courierPrice.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Total ',
                  value:
                      widget.buyerOrder.attributes.totalPrice.currencyFormatRp,
                  valueColor: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
