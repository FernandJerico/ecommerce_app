import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/components/space_height.dart';
import '../../bloc/buyer_order/buyer_order_bloc.dart';
import '../widgets/order_card.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<BuyerOrderBloc>().add(const BuyerOrderEvent.getBuyerOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
      ),
      body: BlocBuilder<BuyerOrderBloc, BuyerOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const SpaceHeight(0),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (data) {
                if (data.isEmpty) {
                  return const Center(child: Text('Tidak ada data'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  separatorBuilder: (context, index) => const SpaceHeight(16.0),
                  itemCount: data.length,
                  itemBuilder: (context, index) => OrderCard(
                    data: data[index],
                  ),
                );
              });
        },
      ),
    );
  }
}
