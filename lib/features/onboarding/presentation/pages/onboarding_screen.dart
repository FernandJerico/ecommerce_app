import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/login_screen.dart';
import 'package:ecommerce_app/features/onboarding/presentation/widgets/onboarding1_widget.dart';
import 'package:ecommerce_app/features/onboarding/presentation/widgets/onboarding2_widget.dart';
import 'package:ecommerce_app/features/onboarding/presentation/widgets/onboarding3_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Stack(alignment: Alignment.topCenter, children: [
                  PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        state.page = value;
                        BlocProvider.of<OnboardingBloc>(context)
                            .add(OnboardingEvent());
                        debugPrint(value.toString());
                      },
                      children: const [
                        OnboardingFirst(),
                        OnboardingSecond(),
                        OnboardingThird(),
                      ]),

                  // use dot indicator

                  // Positioned(
                  //   bottom: 140,
                  //   child: DotsIndicator(
                  //     position: state.page,
                  //     dotsCount: 3,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     decorator: DotsDecorator(
                  //       color: greyColor1,
                  //       activeColor: orangeColor,
                  //       size: const Size.square(8.0),
                  //       activeSize: const Size(32.0, 8.0),
                  //       activeShape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // use row

                  Positioned(
                    bottom: state.page == 0
                        ? sizes.height * 0.3
                        : sizes.height * 0.2,
                    width: sizes.width - 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 6,
                          width: state.page == index ? 42 : 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: state.page == index
                                ? whiteColor
                                : state.page > index
                                    ? whiteColor
                                    : orangeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: SizedBox(
                      height: 50,
                      width: 335,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greyColor1,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (state.page < 2) {
                              pageController.animateToPage(
                                state.page + 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ));
                            }
                          },
                          child: Text(
                            state.page < 1 ? 'Get Started' : 'Next',
                            style: ralewayFont14w600Dark,
                          )),
                    ),
                  )
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
