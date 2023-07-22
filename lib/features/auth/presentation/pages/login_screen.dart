import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/auth_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: greyColor1,
                            borderRadius: BorderRadius.circular(50)),
                        height: 44,
                        width: 44,
                        child: IconButton(
                            onPressed: () => Navigator.pushNamed(
                                context, AppRoutes.onboarding),
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
                              'Hello Again!',
                              style: ralewayFont32Bold,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Fill Your Details Or Continue With \nSocial Media',
                              style: poppinsFont16w400,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email Address',
                                style: ralewayFont16w500,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildFormLogin(
                                  context, 'loremipsum@gmail.com', 'email',
                                  (value) {
                                context.read<AuthBloc>().add(EmailEvent(value));
                              }),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Password',
                                style: ralewayFont16w500,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildFormLogin(
                                  context, 'Enter password', 'password',
                                  (value) {
                                context
                                    .read<AuthBloc>()
                                    .add(PasswordEvent(value));
                              }),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgotPassword);
                          },
                          child: Text(
                            'Recovery Password',
                            style: poppinsFont12wNormal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      buildButton(
                        context,
                        'Sign In',
                        () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, AppRoutes.home);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildButtonGoogle(context, 'Sign In With Google', () {}),
                      const SizedBox(
                        height: 90,
                      ),
                      bottomText(
                        'New User?',
                        ' Create Account',
                        () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
