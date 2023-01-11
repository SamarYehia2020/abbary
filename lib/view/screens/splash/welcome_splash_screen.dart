import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/auth/login_screen.dart';

import 'package:abbar_app/view/screens/splash/p_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class WelcomeSplashScreen extends StatelessWidget {
  WelcomeSplashScreen({Key? key}) : super(key: key);
  final auth_controller = Get.find<AuthController>();
  GetStorage skip = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SplashScreenView(
              navigateRoute: skip.read("isClicked") != null &&
                      skip.read("isClicked") == true
                  ? LoginScreen()
                  : PageViewScreen(),
              imageSrc: "assets/images/logo.png",
              imageSize: 500,
              duration: 5000,
              pageRouteTransition: PageRouteTransition.SlideTransition),
        ),
        // child: Text('Welcome', style: ThemeApp.light.textTheme.headline1),
      ),
    );
  }
}
