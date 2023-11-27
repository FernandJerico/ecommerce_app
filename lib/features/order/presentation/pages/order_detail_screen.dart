import 'package:ecommerce_app/config/extensions/date_time_ext.dart';
import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/row_text.dart';
import '../../../../config/components/space_height.dart';
import '../../data/models/order_product_model.dart';
import '../widgets/order_product_tile.dart';
import '../widgets/order_status.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

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
            itemCount: products.length,
            itemBuilder: (context, index) => OrderProductTile(
              data: products[index],
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
                  value: DateTime.now().toFormattedDateWithDay(),
                ),
                const SpaceHeight(12.0),
                const RowText(
                  label: 'Ekspedisi Pengiriman',
                  value: 'JNE Regular',
                ),
                const SpaceHeight(12.0),
                const RowText(
                  label: 'No. Resi',
                  value: 'QQNSU346JK',
                ),
                const SpaceHeight(12.0),
                const RowText(
                  label: 'Alamat',
                  value: 'Jalan suka cita no 12',
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
                  label: 'Item (2)',
                  value: 1900000.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Ongkir',
                  value: 120000.currencyFormatRp,
                ),
                const SpaceHeight(12.0),
                RowText(
                  label: 'Total ',
                  value: 2020000.currencyFormatRp,
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
