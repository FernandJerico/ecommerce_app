import 'package:ecommerce_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../config/theme/theme.dart';
import '../bloc/auth_bloc.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  int durationInSeconds = 30;

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(StartTimerEvent(30)); // 30 detik
  }

  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
        width: 70,
        height: 56,
        textStyle: poppinsFont18semiBold,
        decoration: BoxDecoration(
            color: greyColor1, borderRadius: BorderRadius.circular(12)));

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 16, top: 12, bottom: 30),
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
                      'OTP Verification',
                      style: ralewayFont32Bold,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Please Check Your Email To See The \nVerification Code',
                      style: poppinsFont16w400,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'OTP Code',
                style: ralewayFont21semiBold,
              ),
              const SizedBox(
                height: 15,
              ),
              FractionallySizedBox(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            length: 4,
                            keyboardType: TextInputType.number,
                            preFilledWidget: Text(
                              '',
                              style: poppinsFont18semiBold,
                            ),
                            controller: pinController,
                            focusNode: focusNode,
                            defaultPinTheme: pinTheme,
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'OTP Code Cannot Be Empty!';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        buildButton(context, 'Verify', () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.login);
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is TimerRunningState) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Resend code to',
                                    style: ralewayFont12wNormal,
                                  ),
                                  Text(
                                    '00:${state.remainingSeconds.toString().padLeft(2, '0')}',
                                    style: ralewayFont12wNormal,
                                  )
                                ],
                              );
                            } else if (state is TimerFinishedState) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Resend code to',
                                    style: ralewayFont12wNormal,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                          StartTimerEvent(durationInSeconds));
                                    },
                                    child: Text(
                                      'Send',
                                      style: ralewayFont12wNormal,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
