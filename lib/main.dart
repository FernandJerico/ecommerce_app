import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'E-Commerce App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
          home: const OnboardingScreen(),
        ));
  }
}
