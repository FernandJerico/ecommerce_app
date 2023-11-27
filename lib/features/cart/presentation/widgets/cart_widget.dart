// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/features/cart/data/model/request/order_request_model.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import 'package:ecommerce_app/config/extensions/int_ext.dart';

import '../../../../config/constants/variables.dart';
import '../../../../config/theme/theme.dart';
import '../../data/model/cart_model.dart';
import '../bloc/get_cost/get_cost_bloc.dart';
import '../bloc/order/order_bloc.dart';
import '../pages/payment_screen.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    titleSpacing: 0,
    leadingWidth: 50,
    backgroundColor: greyColor1,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        )),
    centerTitle: true,
    title: Text(
      'My Cart',
      style: ralewayFont16semiBold,
    ),
  );
}

AppBar buildAppBarAddress(BuildContext context) {
  return AppBar(
    elevation: 0,
    titleSpacing: 0,
    leadingWidth: 50,
    backgroundColor: greyColor1,
    leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        )),
    centerTitle: true,
    title: Text(
      'Add Address',
      style: ralewayFont16semiBold,
    ),
  );
}

class ListProductCart extends StatefulWidget {
  const ListProductCart({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Cart item;

  @override
  State<ListProductCart> createState() => _ListProductCartState();
}

class _ListProductCartState extends State<ListProductCart> {
  @override
  Widget build(BuildContext context) {
    return buildListProductCart(widget.item);
  }

  SwipeActionCell buildListProductCart(Cart item) {
    return SwipeActionCell(
      key: Key(item.product.attributes.name),
      leadingActions: [
        SwipeAction(
          onTap: (handler) {},
          color: greyColor1,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primaryColor,
            ),
            width: 58,
            height: 104,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    context.read<CartBloc>().add(CartEvent.add(widget.item));
                  },
                  child: Iconify(
                    Ic.twotone_plus,
                    color: whiteColor,
                  ),
                ),
                Text(
                  widget.item.qty.toString(),
                  style: ralewayFont14Normal,
                ),
                InkWell(
                  onTap: () {
                    if (widget.item.qty > 0) {
                      context
                          .read<CartBloc>()
                          .add(CartEvent.remove(widget.item));
                    }
                  },
                  child: Iconify(
                    Ic.baseline_minus,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      trailingActions: [
        SwipeAction(
            color: greyColor1,
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: dangerColor,
              ),
              width: 58,
              height: 104,
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
            ),
            onTap: (handler) {
              context.read<CartBloc>().add(CartEvent.delete(widget.item));
              handler(true);
            }),
      ],
      child: Container(
        height: 104,
        width: 267,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: whiteColor),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 28),
            height: 85,
            width: 87,
            decoration: BoxDecoration(
                color: greyColor1, borderRadius: BorderRadius.circular(16)),
            child: Image.network(
                '${Variables.baseUrl}${item.product.attributes.images.data.first.attributes.url}'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product.attributes.name,
                style: ralewayFont16w500,
                overflow: TextOverflow.clip,
              ),
              Text(
                int.parse(item.product.attributes.price).currencyFormatRp,
                style: poppinsFont14w500,
              )
            ],
          )
        ]),
      ),
    );
  }
}

Row buildTextCart(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: ralewayFont16w500Grey,
      ),
      Text(
        price,
        style: poppinsFont16w500,
      )
    ],
  );
}

SvgPicture buildDivider(BuildContext context) {
  return SvgPicture.asset(
    'assets/icons/divider.svg',
    width: MediaQuery.of(context).size.width,
  );
}

Row buildTotalCost(String text, String totalPrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: ralewayFont16w500,
      ),
      Text(
        totalPrice,
        style: poppinsFont16w500primaryColor,
      ),
    ],
  );
}

Row buildContactInformation(String iconPath, String text, String typeContact) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 20, right: 20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: greyColor1, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: SvgPicture.asset(iconPath),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: poppinsFont14w500Dark,
          ),
          Text(
            typeContact,
            style: poppinsFont12w500,
          )
        ],
      ),
      const Expanded(
        child: SizedBox(),
      ),
      IconButton(
          onPressed: () {}, icon: SvgPicture.asset('assets/icons/edit.svg'))
    ],
  );
}

Row buildPaymentMethod(String imagePath, String name, String cardNumber) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 20, right: 20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: greyColor1, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(imagePath),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: poppinsFont14w500Dark,
          ),
          Text(
            cardNumber,
            style: poppinsFont12w500,
          )
        ],
      ),
      const Expanded(
        child: SizedBox(),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: greyColor,
        ),
      )
    ],
  );
}

Widget buildButtonCartCheckout(
    BuildContext context, String buttonName, VoidCallback onPressed) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: ralewayFont14w600,
      ),
    ),
  );
}

Widget buildButtonCartCheckoutDisabled(
    BuildContext context, String buttonName) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: greyColor2,
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Center(child: Text(buttonName, style: ralewayFont14w600)));
}

Positioned buildPositionedBottomCartCheckout(
    BuildContext context, VoidCallback onPressed) {
  return Positioned(
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
                    totalPrice += int.parse(element.product.attributes.price) *
                        element.qty;
                  }
                  carts
                      .map(
                        (e) => Item(
                            id: e.product.id,
                            productName: e.product.attributes.name,
                            price: int.parse(e.product.attributes.price),
                            qty: e.qty),
                      )
                      .toList();
                  return buildTextCart('Subtotal', totalPrice.currencyFormatRp);
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return buildTextCart('Delivery', '-');
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return buildTotalCost('Total Cost', 0.currencyFormatRp);
                },
                loaded: (carts) {
                  int totalPrice = 0;
                  for (var element in carts) {
                    totalPrice += int.parse(element.product.attributes.price) *
                        element.qty;
                  }
                  return buildTotalCost(
                      'Total Cost', totalPrice.currencyFormatRp);
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loaded: (cart) {
                if (cart.isEmpty) {
                  return buildButtonCartCheckoutDisabled(context, 'Checkout');
                }
                return buildButtonCartCheckout(context, 'Checkout', () {
                  Navigator.pushNamed(context, AppRoutes.checkout);
                });
              });
            },
          )
        ]),
      ),
    ),
  );
}

Widget buildButtonCheckout(
    BuildContext context, String buttonName, VoidCallback onPressed) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: ralewayFont14w600,
      ),
    ),
  );
}

Positioned buildPositionedBottomCheckout(
    BuildContext context, VoidCallback onPressed) {
  List<Item> items = [];
  int localtotalPrice = 0;
  int localpriceDelivery = 0;
  return Positioned(
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
                    totalPrice += int.parse(element.product.attributes.price) *
                        element.qty;
                  }
                  localtotalPrice = totalPrice;
                  items = carts
                      .map(
                        (e) => Item(
                            id: e.product.id,
                            productName: e.product.attributes.name,
                            price: int.parse(e.product.attributes.price),
                            qty: e.qty),
                      )
                      .toList();
                  return buildTextCart('Subtotal', totalPrice.currencyFormatRp);
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
                  return buildTextCart(
                      'Delivery',
                      cost.rajaongkir.results.first.costs.first.cost.first.value
                          .currencyFormatRp);
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return buildTotalCost('Total Cost', 0.currencyFormatRp);
                },
                loaded: (carts) {
                  int totalPrice = 0;
                  for (var element in carts) {
                    totalPrice += int.parse(element.product.attributes.price) *
                        element.qty;
                  }
                  int priceDelivery = 0;
                  for (var element in carts) {
                    priceDelivery += 9000 * element.qty;
                  }
                  return buildTotalCost('Total Cost',
                      (totalPrice + priceDelivery).currencyFormatRp);
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
                  context.read<CartBloc>().add(const CartEvent.started());
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
                    () {
                      context.read<OrderBloc>().add(
                            OrderEvent.order(
                              OrderRequestModel(
                                data: Data(
                                    items: items,
                                    totalPrice: localtotalPrice,
                                    deliveryAddress: 'Rungkut, Kota Suarabaya',
                                    courierName: 'Afif Maaruf',
                                    courierPrice: localpriceDelivery,
                                    status: 'waiting-payment'),
                              ),
                            ),
                          );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
          )
        ]),
      ),
    ),
  );
}
