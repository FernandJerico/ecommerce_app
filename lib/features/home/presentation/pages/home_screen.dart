import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/navbar/presentation/pages/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/product.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> category = [
    'All Shoes',
    'Outdoor',
    'Tennis',
    'Football',
  ];

  List<Product> productList = [
    Product(
      imagePath: 'assets/images/nike-jordan.png',
      name: 'Nike Jordan',
      price: 302000,
      isFavorited: false,
    ),
    Product(
      imagePath: 'assets/images/nike-air-max.png',
      name: 'Nike Air Max',
      price: 752000,
      isFavorited: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor1,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  'assets/icons/Hamburger.svg')),
                          Image.asset(
                            'assets/images/logo-explore.png',
                            scale: 1.8,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: whiteColor),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 8, top: 8, bottom: 8),
                                    child: SvgPicture.asset(
                                        'assets/icons/bag-2.svg'),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: dangerColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 52,
                            width: MediaQuery.of(context).size.width * 0.72,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.1), // Shadow color
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Iconify(
                                Ri.search_line,
                                color: greyColor2,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Looking for shoes',
                                  hintStyle: poppinsFont14w500,
                                  border: InputBorder.none,
                                ),
                              ))
                            ]),
                          ),
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Iconify(
                                Lucide.sliders_horizontal,
                                color: whiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Select Category',
                        style: ralewayFont16semiBold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10,
                              direction: Axis.horizontal,
                              children: [
                                ...List<Widget>.generate(
                                  category.length,
                                  (int index) {
                                    return products(
                                        context, index, state, category);
                                  },
                                ).toList(),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      textSpaceBetween(
                          'Popular Shoes', ralewayFont16w500, 'See all', () {}),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Jumlah kolom dalam grid
                            crossAxisSpacing: 10, // Jarak antar kolom
                            mainAxisSpacing: 10, // Jarak antar baris
                            childAspectRatio:
                                0.8, // Perbandingan aspek antara lebar dan tinggi item
                          ),
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final product = productList[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Iconify(
                                          product.isFavorited
                                              ? Mdi.cards_heart
                                              : Mdi.cards_heart_outline,
                                          color: product.isFavorited
                                              ? dangerColor
                                              : greyColor2,
                                          size: 18,
                                        ),
                                        Center(
                                          child: Image.asset(
                                            product.imagePath,
                                            height: 90,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        Text(
                                          'Best Seller',
                                          style: poppinsFontCustom(
                                              fontSize: 12,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 7),
                                        Text(product.name,
                                            style: ralewayFont16semiBold),
                                        const SizedBox(height: 7),
                                        Text(
                                            NumberFormat.simpleCurrency(
                                                    name: 'IDR')
                                                .format(product.price),
                                            style: poppinsFont14w500),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          height: 34,
                                          width: 34,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16),
                                                    bottomRight:
                                                        Radius.circular(16)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Iconify(
                                              Tabler.plus,
                                              color: whiteColor,
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      textSpaceBetween('New Arrivals', ralewayFont16semiBold,
                          'See all', () {}),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/images/new-arrivals.png'),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ]),
              ),
            ),
          ),
          const Positioned(
            child: NavbarScreen(),
          ),
        ],
      ),
    );
  }
}
