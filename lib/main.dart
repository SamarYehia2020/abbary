import 'package:abbar_app/routes/route.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GetStorage store = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      title: 'abbar',
      initialRoute: AppRoutes.welcome,
      // store.read("auth") != null && store.read("auth") == true
      //     ? AppRoutes.home
      //     :
      // AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
