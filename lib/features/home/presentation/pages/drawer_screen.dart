import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

import '../widgets/drawer_widget.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/user.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Fernand Jerico',
                style: ralewayFont20Bold,
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Iconify(
                  Bx.user,
                  color: whiteColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Profile',
                  style: ralewayFont16w500White,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          listMenu('assets/icons/bag-2.svg', 'My Cart', () {}),
          const SizedBox(
            height: 25,
          ),
          listMenu('assets/icons/heart.svg', 'Favorite', () {}),
          const SizedBox(
            height: 25,
          ),
          listMenu('assets/icons/truck.svg', 'Orders', () {}),
          const SizedBox(
            height: 25,
          ),
          listMenu('assets/icons/notification.svg', 'Notifications', () {}),
          const SizedBox(
            height: 25,
          ),
          listMenu('assets/icons/setting.svg', 'Settings', () {}),
          const SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 2,
            color: whiteColor,
          ),
          const SizedBox(
            height: 20,
          ),
          listMenu('assets/icons/logout.svg', 'Sign Out', () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ), (route) => false);
          }),
        ]),
      ),
    );
  }
}
