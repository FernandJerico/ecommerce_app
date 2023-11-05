import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/data/models/requests/login_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/login/login_bloc.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                              }, emailController),
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
                              }, passwordController),
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
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            success: (data) {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.home);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Success'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            loading: () {
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
                                    onPressed: () {},
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          color: whiteColor),
                                    )),
                              );
                            },
                            error: (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          );
                        },
                        builder: (context, state) {
                          return buildButton(
                            context,
                            'Sign In',
                            () {
                              if (formKey.currentState!.validate()) {
                                final data = LoginRequestModel(
                                    identifier: emailController.text,
                                    password: passwordController.text);
                                context
                                    .read<LoginBloc>()
                                    .add(LoginEvent.login(data));
                              }
                            },
                          );
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
