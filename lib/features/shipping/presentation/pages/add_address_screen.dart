import 'package:ecommerce_app/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/province_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/subdiscrict_response_model.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/city/city_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/components/button.dart';
import '../../../../config/components/custom_dropdown.dart';
import '../../../../config/components/custom_textfield2.dart';
import '../../../../config/components/space_height.dart';
import '../../data/model/response/city_response_model.dart';
import '../bloc/province/province_bloc.dart';
import '../bloc/subdistrict/subdistrict_bloc.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isDefault = false;

  Province selectedProvince = Province(
    provinceId: '1',
    province: 'Bali',
  );

  City selectedCity = City(
    cityId: '1',
    provinceId: '1',
    province: 'Bali',
    type: 'Kabupaten',
    cityName: 'Badung',
    postalCode: '80351',
  );

  SubDistrict selectedSubDistrict = SubDistrict(
    subdistrictId: '1',
    provinceId: '1',
    province: 'Bali',
    cityId: '1',
    city: 'Badung',
    type: 'Kabupaten',
    subdistrictName: 'Kuta',
  );

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getAll());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Alamat'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: nameController,
            label: 'Nama Lengkap',
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: addressController,
            label: 'Alamat Jalan',
            maxLines: 3,
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: phoneNumberController,
            label: 'No Handphone',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (provinces) {
                  return CustomDropdown(
                    value: provinces.first,
                    items: provinces,
                    label: 'Provinsi',
                    onChanged: (value) {
                      setState(() {
                        selectedProvince = value!;
                        context
                            .read<CityBloc>()
                            .add(CityEvent.getAllByProvinceId(
                              selectedProvince.provinceId,
                            ));
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {},
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (cities) {
                  return CustomDropdown<City>(
                    value: cities.first,
                    items: cities,
                    label: 'Kota/Kabupaten',
                    onChanged: (value) {
                      selectedCity = value!;
                      context.read<SubdistrictBloc>().add(
                            SubdistrictEvent.getAllByCityId(
                              selectedCity.cityId,
                            ),
                          );
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomDropdown(
                    value: '-',
                    items: const ['-'],
                    label: 'Kecamatan',
                    onChanged: (value) {},
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (subdistricts) {
                  return CustomDropdown<SubDistrict>(
                    value: subdistricts.first,
                    items: subdistricts,
                    label: 'Kecamatan',
                    onChanged: (value) {
                      setState(() {
                        selectedSubDistrict = value!;
                      });
                    },
                  );
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          CustomTextField2(
            controller: zipCodeController,
            label: 'Kode Pos',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(24.0),
          CheckboxListTile(
            value: isDefault,
            onChanged: (value) {
              setState(() {
                isDefault = true;
              });
            },
            title: const Text('Simpan Sebagai Alamat Utama'),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AddAddressBloc, AddAddressState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (response) {
                Navigator.pop(context, response);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  onPressed: () async {
                    // get User ID
                    final userId = (await AuthLocalDatasource().getUser()).id;
                    if (context.mounted) {
                      context
                          .read<AddAddressBloc>()
                          .add(AddAddressEvent.addAddress(
                            name: nameController.text,
                            address: addressController.text,
                            phone: phoneNumberController.text,
                            provinceId: selectedProvince.provinceId,
                            cityId: selectedCity.cityId,
                            subdistrictId: selectedSubDistrict.subdistrictId,
                            provinceName: selectedProvince.province,
                            cityName: selectedCity.cityName,
                            subdistrictName:
                                selectedSubDistrict.subdistrictName,
                            zipCode: zipCodeController.text,
                            userId: userId!,
                            isDefault: isDefault,
                          ));
                    }
                  },
                  label: 'Tambah Alamat',
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
