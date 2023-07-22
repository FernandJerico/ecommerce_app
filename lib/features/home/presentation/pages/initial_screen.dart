import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/home/presentation/pages/drawer_screen.dart';
import 'package:ecommerce_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      body: const Stack(children: [
        DrawerScreen(),
        HomeScreen(),
      ]),
    );
  }
}
