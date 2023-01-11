import 'package:abbar_app/models/auth/cities_model.dart';
import 'package:abbar_app/models/auth/city_model.dart';
import 'package:abbar_app/services/account/profile_service.dart';
import 'package:abbar_app/services/auth_services/login_service.dart';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:abbar_app/services/city_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class AuthController extends GetxController {
  CityService city = CityService();
  RegisterServices register = RegisterServices();
  LoginServices login = LoginServices();
  ProfileService profile = ProfileService();
  var loginInfo;
  var signUpInfo;
  var profileInfo;
  final box = GetStorage();
  var cityInfo;
  List cities = [];
  List<CityModel>? cityname;
  CityModel? cityModel;
  List cityId = [];
  List? registInfo;
  String? phoneInfo;
  String? username;
  String? password;
  bool isLogged = false;
  Object? dropVal;
  String mToken = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    requestPermission();
    getToken();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      mToken = token!;

      saveToken(token);
      // update();
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("User Tokens")
        .doc("user2")
        .set({'token': token});
    box.write("deviceToken", mToken);
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user guaranteed permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("user guarenteed provisional permission");
    } else {
      print("not permitted");
    }
  }

  // box.write("phone", username);
  // void setDetails() {
  //   box.write("phone", username);
  //   box.write("pass", password);
  // }

  // getDetails() {
  //   print(box.read("phone"));
  //   print(box.read("pass"));
  // }

  Future<dynamic> cityInfoFunction() async {
    cityInfo = await city.cityInfo();

    // cities = List.generate(cityInfo.length, (index) => cityInfo[index].name);
    return cityInfo;
  }

  // Future<dynamic> cityInfoFunctionById() async {
  //   cityInfo = await city.cityInfo();

  //   // cityId = List.generate(cityInfo.length, (index) => cityInfo[index].id);
  //   return cityInfo;
  // }
  Future signUpDetails(String phone, String name, int cityId, String email,
      String password, String confirm_pass) async {
    signUpInfo = await register.register(
        phone: phone,
        name: name,
        cityId: cityId,
        email: email,
        password: password,
        password_confirmation: confirm_pass);
    if (signUpInfo.statusCode == 200) {
      box.write("phoneSignUp", phone);

      print("ok");
    }
  }

  Future loginDetails(String phone, String pass) async {
    loginInfo = await login.login(phone: phone, password: pass);
    print(loginInfo.statusCode);

    // String message;
    // // final res = jsonDecode(loginInfo.body);

    if (loginInfo.statusCode == 200) {
      isLogged = true;
      box.write("auth", isLogged);

      var data = loginInfo.body;
      var jsonData = jsonDecode(data)['data'];
      print("api-token is" + jsonData['api_token']);

      box.write("cityName", jsonData['city']['name']);
      box.write("cityId", jsonData['city']['id']);

      box.write("name", jsonData['name']);
      box.write("email", jsonData['email']);
      box.write("phone", jsonData['phone']);

      box.write("apiToken", jsonData['api_token']);

      // var myname = loginInfo['data'].name;
      // print(myname);

      // box.write("profile-name", loginInfo.name);
      // box.write("profile-email", loginInfo.email);
      // box.write("profile-phone", loginInfo.phone);

      // box.write("phone", phone);
      // box.write("password", pass);

      update();
      Get.toNamed("/IndexScreen");
    }
  }

  logOut() {
    isLogged = false;
    box.remove("auth");
    box.write("auth", isLogged);
    box.remove("cityName");
    box.remove("cityId");
    box.write("cityId", 2);
    box.remove("name");
    box.remove("email");
    box.remove("phone");
    // box.write("apiToken",
    //     "a7UgkaA089d3ocH0TKXh48j2kLgF9PUSgzG15yV0CkZDKsOB5lnWE1w18Qdb");
    Get.toNamed("/LoginScreen");
  }
}
