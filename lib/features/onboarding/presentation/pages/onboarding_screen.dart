import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
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
                        OnboardingPages(
                            imagePath: 'assets/images/onboarding-1.png'),
                        OnboardingPages(
                            imagePath: 'assets/images/onboarding-2.png'),
                        OnboardingPages(
                            imagePath: 'assets/images/onboarding-3.png'),
                      ]),
                  Positioned(
                    bottom: 140,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: whiteColor,
                        activeColor: orangeColor,
                        size: const Size.square(8.0),
                        activeSize: const Size(32.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
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
                            backgroundColor: whiteColor,
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
                              // Handle action when the last page is reached
                            }
                          },
                          child: Text(
                            state.page < 1 ? 'Get Started' : 'Next',
                            style: ralewayFont(
                                color: darkColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
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
