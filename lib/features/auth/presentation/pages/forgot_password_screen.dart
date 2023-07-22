import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/theme/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: greyColor1, borderRadius: BorderRadius.circular(50)),
                height: 44,
                width: 44,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Forgot Password',
                      style: ralewayFont32Bold,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Enter Your Email Account To Reset \nYour Password',
                      style: poppinsFont16w400,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              buildFormLogin(context, 'x x x x x x x x', 'email', (value) {}),
              const SizedBox(
                height: 35,
              ),
              buildButton(context, 'Reset Password', () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WillPopScope(
                      onWillPop: () async {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.verificationCode);
                        return false;
                      },
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        contentPadding: EdgeInsets.zero,
                        content: Container(
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30, bottom: 40),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/email1.svg',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text('Check Your Email',
                                  style: ralewayFont16Bold),
                              const SizedBox(height: 16.0),
                              Text(
                                'We Have Send Password Recovery Code In Your Email',
                                style: poppinsFont16wNormal,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
