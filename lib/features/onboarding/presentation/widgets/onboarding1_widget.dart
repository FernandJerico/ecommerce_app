import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardingFirst extends StatelessWidget {
  const OnboardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          child: Image.asset(
            'assets/images/onboarding-first.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Stack(
          children: [
            Positioned(
              height: sizes.height,
              width: sizes.width,
              bottom: sizes.height * 0.024,
              child: Image.asset(
                'assets/images/shoes-onboarding-1.png',
              ),
            ),
            Positioned(
              width: sizes.width * 0.75,
              top: sizes.height * 0.13,
              left: sizes.width * 0.135,
              child: Text(
                'WELCOME TO\nNIKE',
                textAlign: TextAlign.center,
                style: ralewayOnboardingText1,
              ),
            ),
          ],
        )
      ],
    );
  }
}
