import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';

class OnboardingThird extends StatelessWidget {
  const OnboardingThird({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: sizes.height,
          width: sizes.width,
          color: drawerColor,
        ),
        Positioned(
          height: sizes.height,
          width: sizes.width,
          bottom: sizes.height * 0.16,
          child: Image.asset(
            'assets/images/abstract-o.png',
            scale: 4,
          ),
        ),
        Stack(
          children: [
            Positioned(
              height: 77,
              width: 77,
              left: sizes.width * 0.05,
              top: sizes.height * 0.1,
              child: Image.asset('assets/images/smile-lg.png'),
            ),
            Positioned(
              height: sizes.height,
              width: sizes.width,
              bottom: sizes.height * 0.17,
              right: sizes.width * 0.055,
              child: Image.asset(
                'assets/images/shoes-onboarding-3.png',
                scale: 4,
              ),
            ),
            Positioned(
              height: sizes.height,
              width: 176,
              bottom: sizes.height * 0.027,
              left: sizes.width * 0.2,
              child: Image.asset(
                'assets/images/shadow-3.png',
              ),
            ),
            Positioned(
              width: sizes.width,
              bottom: sizes.height * 0.33,
              child: Text(
                'You Have the\nPower To',
                textAlign: TextAlign.center,
                style: ralewayOnboardingText2,
              ),
            ),
            Positioned(
              width: sizes.width,
              bottom: sizes.height * 0.25,
              child: Text(
                'There Are Many Beautiful And Attractive\nPlants To Your Room',
                textAlign: TextAlign.center,
                style: poppinsOnboardingText,
              ),
            ),
            Positioned(
                width: sizes.width,
                bottom: sizes.height * 0.25,
                child: Image.asset('assets/images/nike-bg.png')),
          ],
        )
      ],
    );
  }
}
