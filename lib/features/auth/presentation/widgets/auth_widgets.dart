import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../../../config/theme/theme.dart';
import '../bloc/auth_bloc.dart';

TextFormField buildFormLogin(BuildContext context, String text, String textType,
    void Function(String value)? function, TextEditingController controller) {
  final obscureText = textType == "password";

  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'This field is required.';
      } else {
        return null;
      }
    },
    controller: controller,
    onChanged: (value) => function!(value),
    obscureText: obscureText &&
        context.select((AuthBloc bloc) => bloc.state.obscureText),
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
      suffixIcon: obscureText
          ? IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(ToggleObscureTextEvent());
              },
              icon: Iconify(
                context.select(
                  (AuthBloc bloc) => bloc.state.obscureText
                      ? Mdi.eye_off_outline
                      : Mdi.eye_outline,
                ),
                color: greyColor2,
              ),
            )
          : null,
      fillColor: greyColor1,
      filled: true,
    ),
    style: poppinsFont14w500,
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
            style: ralewayFont14w600Dark,
          )
        ],
      ),
    ),
  );
}

Row bottomText(String text, String navigator, VoidCallback onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: ralewayFont16w500Grey2,
      ),
      InkWell(
        onTap: onPressed,
        child: Text(
          navigator,
          style: ralewayFont16w500,
        ),
      ),
    ],
  );
}
