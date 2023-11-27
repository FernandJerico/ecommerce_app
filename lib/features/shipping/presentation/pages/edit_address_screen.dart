import 'package:ecommerce_app/features/shipping/data/model/response/get_address_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/components/button.dart';
import '../../../../config/components/custom_dropdown.dart';
import '../../../../config/components/custom_textfield2.dart';
import '../../../../config/components/space_height.dart';

class EditAddressScreen extends StatefulWidget {
  final GetAddress data;
  const EditAddressScreen({super.key, required this.data});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late ValueNotifier<String> selectedCountry;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController secondAddressController;
  late TextEditingController cityController;
  late TextEditingController provinceController;
  late TextEditingController zipCodeController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    selectedCountry = ValueNotifier<String>('Indonesia');
    firstNameController =
        TextEditingController(text: widget.data.attributes.name);
    lastNameController = TextEditingController(text: '');
    addressController =
        TextEditingController(text: widget.data.attributes.address);
    secondAddressController =
        TextEditingController(text: 'Jalan suka-suka, no 12');
    cityController = TextEditingController(text: 'Jember');
    provinceController = TextEditingController(text: 'Jawa Timur');
    zipCodeController = TextEditingController(text: '57793');
    phoneNumberController =
        TextEditingController(text: widget.data.attributes.phone);
    super.initState();
  }

  @override
  void dispose() {
    selectedCountry.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    secondAddressController.dispose();
    cityController.dispose();
    provinceController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Alamat'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ValueListenableBuilder(
            valueListenable: selectedCountry,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: const ['Indonesia', 'Inggris'],
              label: 'Negara atau wilayah',
              onChanged: (value) => selectedCountry.value = value!,
            ),
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: firstNameController,
            label: 'Nama Depan',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: lastNameController,
            label: 'Nama Belakang',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: addressController,
            label: 'Alamat Jalan',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: secondAddressController,
            label: 'Alamat jalans 2 (Opsional)',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: cityController,
            label: 'Kota',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: provinceController,
            label: 'Provinsi',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Button.filled(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'Update Alamat',
        ),
      ),
    );
  }
}
