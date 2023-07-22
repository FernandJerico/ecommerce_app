import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../../config/theme/theme.dart';
import '../../../auth/presentation/pages/forgot_password_screen.dart';

TextFormField buildForm(BuildContext context, String text) {
  return TextFormField(
    readOnly: true,
    keyboardType: TextInputType.multiline,
    decoration: InputDecoration(
      hintText: text,
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: greyColor1,
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
      hintStyle: TextStyle(
        color: greyColor2,
      ),
      fillColor: greyColor1,
      filled: true,
    ),
    style: poppinsFont14w500,
  );
}

TextFormField buildFormEdit(BuildContext context, String text, String textType,
    void Function(String value)? function) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'This field is required.';
      } else {
        return null;
      }
    },
    onChanged: (value) => function!(value),
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
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: dangerColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: dangerColor,
        ),
      ),
      hintStyle: TextStyle(
        color: greyColor2,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: Iconify(
          Ic.sharp_check,
          color: primaryColor,
        ),
      ),
      fillColor: greyColor1,
      filled: true,
    ),
    style: poppinsFont14w500,
  );
}

Align buildButtonRecoveryPass(BuildContext context) {
  return Align(
    alignment: Alignment.bottomRight,
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ForgotPasswordScreen();
          },
        ));
      },
      child: Text(
        'Recovery Password',
        style: poppinsFont12wNormal,
      ),
    ),
  );
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
        style: ralewayFont14w600,
      ),
    ),
  );
}
