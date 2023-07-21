import 'package:ecommerce_app/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:ecommerce_app/features/profile/presentation/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

import '../../../../config/theme/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: greyColor1,
                        borderRadius: BorderRadius.circular(50)),
                    height: 44,
                    width: 44,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                        )),
                  ),
                  Text(
                    'Profile',
                    style: ralewayFont21semiBold,
                  ),
                  const SizedBox(
                    height: 44,
                    width: 44,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: whiteColor,
                    backgroundImage: const AssetImage('assets/images/user.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 13,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const EditProfileScreen();
                          },
                        ));
                      },
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Iconify(
                            Ic.round_mode_edit,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Name',
                    style: ralewayFont16w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildForm(context, 'Fernand Jerico'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email Address',
                    style: ralewayFont16w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildForm(context, 'loremipsum@gmail.com'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Password',
                    style: ralewayFont16w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildForm(context, '********'),
                  const SizedBox(
                    height: 10,
                  ),
                  buildButtonRecoveryPass(context),
                  const SizedBox(
                    height: 30,
                  ),
                  buildButton(context, 'Save Now', () {
                    Navigator.pop(context);
                  })
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
