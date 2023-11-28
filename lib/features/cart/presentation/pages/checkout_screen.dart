import 'package:ecommerce_app/config/components/custom_dropdown.dart';
import 'package:ecommerce_app/config/extensions/int_ext.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/get_cost/get_cost_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/get_address/get_address_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/pages/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/courier_model.dart';
import '../../data/model/request/order_request_model.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/order/order_bloc.dart';
import '../widgets/cart_widget.dart';
import 'payment_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    context.read<GetAddressBloc>().add(const GetAddressEvent.getAddress());
    super.initState();
  }

  List<Item> items = [];
  int localtotalPrice = 0;
  int localpriceDelivery = 0;
  int idAddress = 0;
  String courierName = 'jne';
  int courierPrice = 0;
  String deliveryAddress = 'Rungkut, Kota Surabaya';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor1,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Column(
              children: [
                buildAppBar(context),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.only(
                      left: 20, right: 40, top: 15, bottom: 20),
                  height: 460,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: BlocBuilder<GetAddressBloc, GetAddressState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        loaded: (response) {
                          if (response.data.isEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Tidak Ada Alamat'),
                                ElevatedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShippingAddressScreen(),
                                        )),
                                    child:
                                        const Text('Pilih Alamat Pengiriman'))
                              ],
                            );
                          }
                          // final address = response.data.firstWhere(
                          //   (element) => element.attributes.isDefault,
                          //   orElse: () => response.data.first,
                          // );
                          final address = idAddress != 0
                              ? response.data.firstWhere(
                                  (element) => element.id == idAddress,
                                  orElse: () => response.data.first,
                                )
                              : response.data.last;
                          deliveryAddress = address.attributes.address;
                          context.read<GetCostBloc>().add(
                                GetCostEvent.getCost(
                                    origin: subdistrictOrigin,
                                    destination: address
                                        .attributes.subdistrictId
                                        .toString(),
                                    courier: 'jne'),
                              );
                          idAddress =
                              int.parse(address.attributes.subdistrictId);
                          return ListView(children: [
                            Text(
                              'Contact Information',
                              style: ralewayFont14w600Dark,
                            ),
                            buildContactInformation('assets/icons/chat.svg',
                                address.attributes.name, 'Full Name'),
                            buildContactInformation('assets/icons/call.svg',
                                address.attributes.phone, 'Phone'),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address',
                                  style: ralewayFont14w600Dark,
                                ),
                                InkWell(
                                  onTap: () async {
                                    idAddress = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShippingAddressScreen(),
                                        ));
                                    setState(() {});
                                  },
                                  child: Text(
                                    'More',
                                    style: ralewayFont15Bold,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.67,
                                  child: Text(
                                    address.attributes.address,
                                    style: poppinsFont12w500,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: greyColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/Map.png',
                              height: 101,
                              width: 295,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'Kurir',
                            //   style: ralewayFont14w600Dark,
                            // ),

                            // buildPaymentMethod('assets/images/mandiri.png',
                            //     'Fernand Jerico', '**** **** 0696 4629'),
                            CustomDropdown<Courier>(
                              value: couriers.first,
                              items: couriers,
                              label: 'Kurir',
                              onChanged: (value) {
                                courierName = value!.code;
                                context.read<GetCostBloc>().add(
                                    GetCostEvent.getCost(
                                        origin: subdistrictOrigin,
                                        destination: idAddress.toString(),
                                        courier: value.code));
                              },
                            ),

                            const SizedBox(
                              height: 60,
                            ),
                          ]);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
                child: Column(children: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return buildTextCart('Subtotal', 0.currencyFormatRp);
                        },
                        loaded: (carts) {
                          int totalPrice = 0;
                          for (var element in carts) {
                            totalPrice +=
                                int.parse(element.product.attributes.price) *
                                    element.qty;
                          }
                          localtotalPrice = totalPrice;
                          items = carts
                              .map(
                                (e) => Item(
                                    id: e.product.id,
                                    productName: e.product.attributes.name,
                                    price:
                                        int.parse(e.product.attributes.price),
                                    qty: e.qty),
                              )
                              .toList();
                          return buildTextCart(
                              'Subtotal', totalPrice.currencyFormatRp);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<GetCostBloc, GetCostState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return buildTextCart('Delivery', 0.currencyFormatRp);
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        loaded: (cost) {
                          courierPrice = cost.rajaongkir.results.first.costs
                              .first.cost.first.value;
                          return buildTextCart(
                              'Delivery',
                              cost.rajaongkir.results.first.costs.first.cost
                                  .first.value.currencyFormatRp);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildDivider(context),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<GetCostBloc, GetCostState>(
                    builder: (context, state2) {
                      return BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return buildTotalCost(
                                  'Total Cost', 0.currencyFormatRp);
                            },
                            loaded: (carts) {
                              int courierPrice = state2.maybeWhen(
                                  orElse: () => 0,
                                  loaded: (cost) => cost.rajaongkir.results
                                      .first.costs.first.cost.first.value);
                              int totalPrice = 0;
                              for (var element in carts) {
                                totalPrice += int.parse(
                                        element.product.attributes.price) *
                                    element.qty;
                              }
                              totalPrice += courierPrice;
                              localtotalPrice = totalPrice;
                              return buildTotalCost(
                                  'Total Cost', totalPrice.currencyFormatRp);
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<OrderBloc, OrderState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: (request) {
                          context
                              .read<CartBloc>()
                              .add(const CartEvent.started());
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PaymentScreen(
                                invoiceUrl: request.invoiceUrl,
                                orderId: request.externalId,
                              );
                            },
                          ));
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return buildButtonCheckout(
                            context,
                            'Checkout',
                            () async {
                              final user =
                                  await AuthLocalDatasource().getUser();
                              if (context.mounted) {
                                context.read<OrderBloc>().add(
                                      OrderEvent.order(
                                        OrderRequestModel(
                                          data: Data(
                                            items: items,
                                            totalPrice: localtotalPrice,
                                            deliveryAddress: deliveryAddress,
                                            courierName: courierName,
                                            courierPrice: courierPrice,
                                            status: 'waiting-payment',
                                            buyerId: user.id.toString(),
                                          ),
                                        ),
                                      ),
                                    );
                              }
                            },
                          );
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
                  )
                ]),
              ),
            ),
          )
          //   buildPositionedBottomCheckout(
          //     context,
          //     () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(16.0),
          //             ),
          //             contentPadding: EdgeInsets.zero,
          //             content: Container(
          //               decoration: BoxDecoration(
          //                   color: whiteColor,
          //                   borderRadius: BorderRadius.circular(16)),
          //               padding: const EdgeInsets.only(
          //                   left: 20, right: 20, top: 30, bottom: 40),
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.min,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                     height: 134,
          //                     width: 134,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(200),
          //                         color: const Color(0xffDFEFFF)),
          //                     child: Padding(
          //                         padding: const EdgeInsets.all(25),
          //                         child:
          //                             Image.asset('assets/images/horaayy.png')),
          //                   ),
          //                   const SizedBox(height: 16.0),
          //                   Text(
          //                     'Your Payment Is Successful',
          //                     style: ralewayFont21semiBold,
          //                     textAlign: TextAlign.center,
          //                   ),
          //                   const SizedBox(height: 16.0),
          //                   Padding(
          //                     padding: const EdgeInsets.only(left: 30, right: 30),
          //                     child: buildButton(context, 'Back To Shopping', () {
          //                       Navigator.pop(context);
          //                       Navigator.pop(context);
          //                       Navigator.pop(context);
          //                     }),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   )
        ],
      )),
    );
  }
}
