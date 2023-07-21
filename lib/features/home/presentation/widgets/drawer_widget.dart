import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme.dart';

InkWell listMenu(String iconPath, String text, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: whiteColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: ralewayFont16w500White,
        )
      ],
    ),
  );
}
