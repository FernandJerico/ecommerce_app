import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/navbar_widget.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: sizes.width,
            height: 80,
            child: Stack(children: [
              CustomPaint(
                size: Size(sizes.width, 80),
                painter: CustomPainterNavbar(),
              ),
              Center(
                heightFactor: 0.55,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 3,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: FloatingActionButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    backgroundColor: primaryColor,
                    child: SvgPicture.asset(
                      'assets/icons/bag-2.svg',
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: sizes.width,
                height: 80,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/home.svg'),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/heart.svg'),
                      ),
                      SizedBox(
                        width: sizes.width * 0.20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/notification.svg'),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const ProfileScreen();
                            },
                          ));
                        },
                        icon: SvgPicture.asset('assets/icons/profile.svg'),
                      ),
                    ]),
              )
            ]),
          ))
    ]);
  }
}
