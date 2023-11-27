import 'package:flutter/material.dart';

import '../../../../config/components/space_height.dart';
import '../../data/models/transaction_model.dart';
import '../widgets/order_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<TransactionModel> transactions = [
    TransactionModel(
      noResi: 'QQNSU346JK',
      status: 'Dikirim',
      quantity: 2,
      price: 1900000,
    ),
    TransactionModel(
      noResi: 'SDG1345KJD',
      status: 'Diterima',
      quantity: 2,
      price: 900000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (context, index) => const SpaceHeight(16.0),
        itemCount: transactions.length,
        itemBuilder: (context, index) => OrderCard(
          data: transactions[index],
        ),
      ),
    );
  }
}
