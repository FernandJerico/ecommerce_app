import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: sizes.height,
            width: sizes.width,
            color: drawerColor,
          ),
        ),
        Stack(
          children: [
            Positioned(
              height: 100,
              width: 110,
              left: sizes.width * 0.05,
              top: sizes.height * 0.12,
              child: Image.asset('assets/images/abstract.png'),
            ),
            Positioned(
              height: 45,
              width: 45,
              right: sizes.width * 0.08,
              top: sizes.height * 0.12,
              child: Image.asset('assets/images/smile-sm.png'),
            ),
            Positioned(
              height: sizes.height,
              width: sizes.width,
              bottom: sizes.height * 0.17,
              right: sizes.width * 0.055,
              child: Image.asset(
                'assets/images/shoes-onboarding-2.png',
                scale: 4,
              ),
            ),
            Positioned(
              height: sizes.height,
              width: 250,
              bottom: sizes.height * 0.009,
              left: sizes.width * 0.06,
              child: Image.asset(
                'assets/images/shadow-2.png',
              ),
            ),
            Positioned(
              width: sizes.width,
              bottom: sizes.height * 0.33,
              child: Text(
                'Let\'s Start Journey\nWith Nike',
                textAlign: TextAlign.center,
                style: ralewayOnboardingText2,
              ),
            ),
            Positioned(
              width: sizes.width,
              bottom: sizes.height * 0.25,
              child: Text(
                'Smart, Gorgeous & Fashionable\nCollection Explore Now',
                textAlign: TextAlign.center,
                style: poppinsOnboardingText,
              ),
            ),
            Positioned(
              width: sizes.width,
              bottom: sizes.height * 0.25,
              child: Image.asset('assets/images/nike-bg.png'),
            ),
          ],
        )
      ],
    );
  }
}
