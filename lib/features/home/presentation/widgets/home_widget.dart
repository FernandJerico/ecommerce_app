import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../bloc/home_bloc.dart';

Row textSpaceBetween(
    String text, styleText, String textButton, VoidCallback onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: styleText,
      ),
      InkWell(
        onTap: onTap,
        child: Text(
          textButton,
          style: poppinsFontCustom(
              fontSize: 12, color: primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}

GestureDetector products(
    BuildContext context, int index, HomeState state, category) {
  return GestureDetector(
    onTap: () {
      context.read<HomeBloc>().add(SelectCategoryEvent(index));
    },
    child: Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        color: state.selectedCategory == index ? primaryColor : whiteColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
          child: Text(
        category[index],
        style: poppinsFontCustom(
            color: state.selectedCategory == index ? whiteColor : darkColor,
            fontSize: 12,
            fontWeight: FontWeight.normal),
      )),
    ),
  );
}
