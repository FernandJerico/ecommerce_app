import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../config/theme/theme.dart';

TextFormField buildFormLogin(
    String text, String textType, void Function(String value)? function) {
  return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required.';
        } else {
          return null;
        }
      },
      onChanged: (value) => function!(value),
      obscureText: textType == "password" ? true : false,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: text,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: greyColor1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        hintStyle: TextStyle(
          color: greyColor2,
        ),
        suffixIcon: textType == 'password'
            ? IconButton(
                onPressed: () {},
                icon: Iconify(
                  Mdi.eye_off_outline,
                  color: greyColor2,
                ))
            : null,
        fillColor: greyColor1,
        filled: true,
      ),
      style: poppinsFont(fontSize: 14, fontWeight: FontWeight.w500));
}

Widget buildButton(
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
          style: ralewayFont(
              fontWeight: FontWeight.w600, fontSize: 14, color: whiteColor),
        ),
      ));
}

Widget buildButtonGoogle(
    BuildContext context, String buttonName, VoidCallback onPressed) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: greyColor1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/google_icons.png'),
              const SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: ralewayFont(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: darkColor),
              )
            ],
          )));
}

Row bottomText(String text, String navigator, VoidCallback onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: ralewayFont(
            fontSize: 16, fontWeight: FontWeight.w500, color: greyColor2),
      ),
      InkWell(
          onTap: onPressed,
          child: Text(
            navigator,
            style: ralewayFont(
                fontSize: 16, fontWeight: FontWeight.w500, color: darkColor),
          ))
    ],
  );
}
