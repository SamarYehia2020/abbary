import 'package:abbar_app/bindings/Auth_binding.dart';
import 'package:abbar_app/bindings/account_binding.dart';
import 'package:abbar_app/bindings/gift_binding.dart';
import 'package:abbar_app/bindings/main_binding.dart';
import 'package:abbar_app/bindings/index_binding.dart';
import 'package:abbar_app/bindings/order_binding.dart';
import 'package:abbar_app/db_home.dart';
import 'package:abbar_app/view/screens/about.dart';
import 'package:abbar_app/view/screens/account_details.dart';
import 'package:abbar_app/view/screens/addresses.dart';
import 'package:abbar_app/view/screens/auth/forget_pass_screen.dart';
import 'package:abbar_app/view/screens/auth/login_screen.dart';
import 'package:abbar_app/view/screens/auth/re_enter_pass_screen.dart';
import 'package:abbar_app/view/screens/auth/reset_pass_verification_code.dart';
import 'package:abbar_app/view/screens/auth/sign_up_screen.dart';
import 'package:abbar_app/view/screens/auth/signup_done.dart';
import 'package:abbar_app/view/screens/auth/signup_verification_code_screen.dart';
import 'package:abbar_app/view/screens/cart_screen.dart';
import 'package:abbar_app/view/screens/categories_screen.dart';
import 'package:abbar_app/view/screens/index_screen.dart';
import 'package:abbar_app/view/screens/main_screen.dart';
import 'package:abbar_app/view/screens/monthly_gift.dart';
import 'package:abbar_app/view/screens/my_personal_account.dart';
import 'package:abbar_app/view/screens/orders.dart';
import 'package:abbar_app/view/screens/splash/p_view_screen.dart';
import 'package:abbar_app/view/screens/splash/welcome_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const welcome = '/WelcomeSplash';
  static const home = '/IndexScreen';
  static const dbhome = '/DbHome';
  static final routes = [
    GetPage(name: '/DbHome', page: () => DbHome()),
    GetPage(name: '/CategoriesScreen', page: () => CategoriesScreen()),
    GetPage(
        name: '/WelcomeSplash',
        page: () => WelcomeSplashScreen(),
        binding: AuthBinding()),
    GetPage(name: '/PageViewScreen', page: () => PageViewScreen()),
    GetPage(
        name: '/LoginScreen',
        page: () => LoginScreen(),
        bindings: [AuthBinding(), MainBinding()]),
    GetPage(
        name: '/SignUpScreen',
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(name: '/ForgetPassScreen', page: () => ForgetPassScreen()),
    GetPage(name: '/ReEnterPassScreen', page: () => ReEnterPassScreen()),
    GetPage(name: '/SignUpDoneScreen', page: () => SignUpDoneScreen()),
    GetPage(
        name: '/CartScreen',
        page: () => CartScreen(),
        bindings: [MainBinding()]),
    GetPage(name: '/IndexScreen', page: () => IndexScreen(), bindings: [
      IndexBinding(),
      MainBinding(),
      GiftBinding(),
      AccountBinding(),
      AuthBinding()
    ]),
    GetPage(
        name: '/PersonalAccountScreen',
        page: () => PersonalAccountScreen(),
        bindings: [MainBinding(), AccountBinding()]),
    GetPage(
        name: '/MainScreen',
        page: () => MainScreen(),
        bindings: [MainBinding()]),
    GetPage(
        name: '/SignUpVerificationCodeScreen',
        page: () => SignUpVerificationCodeScreen()),
    GetPage(
        name: '/ResetPassVerificationCodeScreen',
        page: () => ResetPassVerificationCodeScreen()),
    GetPage(
        name: '/MonthlyGiftScreen',
        page: () => MonthlyGiftScreen(),
        binding: GiftBinding()),
    GetPage(
        name: '/OrdersScreen',
        page: () => OrdersScreen(),
        binding: OrderBinding()),
    GetPage(
        name: '/AboutScreen',
        page: () => AboutScreen(),
        binding: AccountBinding()),
    GetPage(
        name: '/AddressesScreen',
        page: () => AdressesScreen(),
        binding: AccountBinding()),
  ];
}
