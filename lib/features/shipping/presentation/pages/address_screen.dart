import 'package:ecommerce_app/features/shipping/presentation/bloc/get_address/get_address_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/pages/add_address_screen.dart';
import 'package:ecommerce_app/features/shipping/presentation/pages/edit_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/components/button.dart';
import '../../../../config/components/space_height.dart';
import '../widget/address_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int? idAddress;

  @override
  void initState() {
    context.read<GetAddressBloc>().add(const GetAddressEvent.getAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengiriman'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddAddressScreen()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<GetAddressBloc, GetAddressState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text('No Data'),
              );
            },
            loaded: (response) {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                separatorBuilder: (context, index) => const SpaceHeight(16.0),
                itemCount: response.data.length,
                itemBuilder: (context, index) => AddressTile(
                  isSelected: idAddress == response.data[index].id,
                  data: response.data[index],
                  onTap: () {
                    idAddress = response.data[index].id;
                    setState(() {});
                  },
                  onEditTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAddressScreen(
                          data: response.data[index],
                        ),
                      ),
                    );
                  },
                  onDeleteTap: () {},
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          disabled: idAddress == null,
          onPressed: () {
            Navigator.pop(context, idAddress);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const OrderDetailPage()),
            // );
          },
          label: 'Pilih',
        ),
      ),
    );
  }
}
