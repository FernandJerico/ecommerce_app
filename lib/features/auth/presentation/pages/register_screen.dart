import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/theme.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    left: 16, right: 16, top: 12, bottom: 20),
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
                              'Register Account',
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
                                'Your Name',
                                style: ralewayFont16w500,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildFormLogin(context, 'xxxxxxxx', 'text',
                                  (value) {
                                context.read<AuthBloc>().add(NameEvent(value));
                              }),
                              const SizedBox(
                                height: 15,
                              ),
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
                                height: 15,
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
                        height: 35,
                      ),
                      buildButton(
                        context,
                        'Sign Up',
                        () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildButtonGoogle(context, 'Sign Up With Google', () {}),
                      const SizedBox(
                        height: 35,
                      ),
                      bottomText(
                        'Already Have Account?',
                        ' Log In',
                        () {
                          Navigator.pushNamed(context, AppRoutes.login);
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
