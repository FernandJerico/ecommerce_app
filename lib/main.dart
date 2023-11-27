import 'package:ecommerce_app/config/routes/app_routes.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/register_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/verification_code_screen.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/presentation/pages/cart_screen.dart';
import 'package:ecommerce_app/features/cart/presentation/pages/checkout_screen.dart';
import 'package:ecommerce_app/features/home/presentation/bloc/products/products_bloc.dart';
import 'package:ecommerce_app/features/home/presentation/pages/initial_screen.dart';
import 'package:ecommerce_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:ecommerce_app/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/add_address/add_address_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/get_address/get_address_bloc.dart';
import 'package:ecommerce_app/features/shipping/presentation/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cart/presentation/bloc/get_cost/get_cost_bloc.dart';
import 'features/cart/presentation/bloc/order/order_bloc.dart';
import 'features/cart/presentation/bloc/order_detail/order_detail_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/profile/presentation/pages/profile_screen.dart';
import 'features/shipping/presentation/bloc/city/city_bloc.dart';
import 'features/shipping/presentation/bloc/province/province_bloc.dart';

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
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) =>
                ProductsBloc()..add(const ProductsEvent.getAll()),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
          BlocProvider(
            create: (context) => OrderBloc(),
          ),
          BlocProvider(
            create: (context) => OrderDetailBloc(),
          ),
          BlocProvider(
            create: (context) => ProvinceBloc(),
          ),
          BlocProvider(
            create: (context) => CityBloc(),
          ),
          BlocProvider(
            create: (context) => SubdistrictBloc(),
          ),
          BlocProvider(
            create: (context) => AddAddressBloc(),
          ),
          BlocProvider(
            create: (context) => GetAddressBloc(),
          ),
          BlocProvider(
            create: (context) => GetCostBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Nike App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.onboarding,
          routes: {
            AppRoutes.onboarding: (context) => FutureBuilder(
                  future: AuthLocalDatasource().isLogin(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null && snapshot.data!) {
                      return const InitialScreen();
                    } else {
                      return const OnboardingScreen();
                    }
                  },
                ),
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => const RegisterScreen(),
            AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
            AppRoutes.verificationCode: (context) =>
                const VerificationCodeScreen(),
            AppRoutes.home: (context) => const InitialScreen(),
            AppRoutes.cart: (context) => const CartScreen(),
            AppRoutes.checkout: (context) => const CheckoutScreen(),
            // AppRoutes.payment: (context) => const PaymentScreen(),
            AppRoutes.profile: (context) => const ProfileScreen(),
            AppRoutes.editProfile: (context) => const EditProfileScreen(),
          },
        ));
  }
}
