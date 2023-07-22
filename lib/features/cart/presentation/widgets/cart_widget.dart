import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/theme.dart';
import '../../data/model/cart_model.dart';

Row buildAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(50)),
        height: 44,
        width: 44,
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
      ),
      Text(
        'My Cart',
        style: ralewayFont16semiBold,
      ),
      const SizedBox(
        height: 44,
        width: 44,
      )
    ],
  );
}

SwipeActionCell buildListProductCart(Cart item) {
  return SwipeActionCell(
    key: Key(item.name),
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
                Iconify(
                  Ic.twotone_plus,
                  color: whiteColor,
                ),
                Text(
                  '1',
                  style: ralewayFont14Normal,
                ),
                Iconify(
                  Ic.baseline_minus,
                  color: whiteColor,
                ),
              ],
            ),
          ))
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
          onTap: (handler) {}),
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
          child: Image.asset(item.imagePath),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: ralewayFont16w500,
            ),
            Text(
              NumberFormat.simpleCurrency(name: 'IDR').format(item.price),
              style: poppinsFont14w500,
            )
          ],
        )
      ]),
    ),
  );
}

Row buildTextCart(String text, int price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: ralewayFont16w500Grey,
      ),
      Text(
        NumberFormat.simpleCurrency(name: 'IDR').format(price),
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

Row buildTotalCost(String text, int totalPrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: ralewayFont16w500,
      ),
      Text(
        NumberFormat.simpleCurrency(name: 'IDR').format(totalPrice),
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
          buildTextCart('Subtotal', 1853900),
          const SizedBox(
            height: 10,
          ),
          buildTextCart('Delivery', 60200),
          const SizedBox(
            height: 15,
          ),
          buildDivider(context),
          const SizedBox(
            height: 15,
          ),
          buildTotalCost('Total Cost', 1914100),
          const SizedBox(
            height: 20,
          ),
          buildButtonCheckout(context, 'Checkout', onPressed)
        ]),
      ),
    ),
  );
}
