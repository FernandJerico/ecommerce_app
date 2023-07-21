import 'package:ecommerce_app/features/profile/presentation/widget/profile_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: ralewayFont15Bold,
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 60,
                backgroundColor: whiteColor,
                backgroundImage: const AssetImage('assets/images/user.png'),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Fernand Jerico',
                style: ralewayFont21semiBold,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Change Profile',
                  style: ralewayFont12semiBold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: ralewayFont16semiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildFormEdit(context, 'Fernand', 'name', (value) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Last Name',
                    style: ralewayFont16semiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildFormEdit(context, 'Jerico', 'name', (value) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Location',
                    style: ralewayFont16semiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildFormEdit(
                      context, 'Brebes, Jawa Tengah', 'name', (value) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobile Number',
                    style: ralewayFont16semiBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildFormEdit(context, '+62   853129866', 'name', (value) {}),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
