import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final String imagePath;
  const OnboardingPages({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
