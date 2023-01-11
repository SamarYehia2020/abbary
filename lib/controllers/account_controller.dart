import 'dart:convert';
import 'dart:ui';

import 'package:abbar_app/models/home/single_product_model.dart';
import 'package:abbar_app/services/account/about_service.dart';
import 'package:abbar_app/services/account/add&delete_adresses_service.dart';
import 'package:abbar_app/services/account/addresses_services.dart';
import 'package:abbar_app/services/account/conditions_service.dart';
import 'package:abbar_app/services/account/create_address_service.dart';
import 'package:abbar_app/services/account/edit_address_service.dart';
import 'package:abbar_app/services/account/favorites_service.dart';
import 'package:abbar_app/services/account/profile_service.dart';
import 'package:abbar_app/services/account/store_fav_service.dart';
import 'package:abbar_app/services/auth_services/login_service.dart';
import 'package:abbar_app/services/others/social_media_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountController extends GetxController {
  AboutService aboutUs = AboutService();
  var aboutItem;
  ConditionsService conditions = ConditionsService();
  var conditionItem;
  ProfileService profileInfo = ProfileService();
  var editProfile;
  SocialMediaService social = SocialMediaService();
  ShowFavorites favorites = ShowFavorites();
  StoreFavorites storeFavorites = StoreFavorites();
  AddressProcesses addressProcesses = AddressProcesses();
  EditAddress editAddress = EditAddress();
  var editaddress;
  RxBool isRadioSelected = false.obs;
  RxBool gval = false.obs;

  var faves;
  var favList;
  var favData;
  var favJsonData;
  var allFavorites;
  var socialItems;
  var facebook = '';
  var snapchat = '';
  var instagram = '';
  var twitter = '';
  var whatsapp = '';
  var delete;
  var iD;
  var name;
  var phone;
  var email;
  var cityId;
  var deviceToken;
  var allAdresses;
  var addressData;
  var addressesJson;
  var deleteAddress;
  var createAddressData;
  var createAddressJson;
  var showAddress;
  var showAddressData;
  var showAddressJsonData;

  RxList addressesList = [].obs;
  bool clicked = false;
  LoginServices loginServices = LoginServices();
  ShowAddresses showAddresses = ShowAddresses();
  CreateAddressService createAddressService = CreateAddressService();
  var addressType;
  var addressTypeData;
  var addressTypeJsonData;

  var createAddress;
  var loginInfo;
  GetStorage box = GetStorage();
  var cityConvert;
  @override
  void onInit() {
    //   // TODO: implement onInit
    super.onInit();
    getSocialData();
    getAdresses();
    getAddressType();
    // showAddresses.showAddresses();
    // getFavorites();
  }

  Future getAbout() async {
    aboutItem = await aboutUs.about();
    return aboutItem;
  }

  Future getConditions() async {
    conditionItem = conditions.getConditions();
    return conditionItem;
  }

  editProfileFun(String name, String phone, String email, int cityId,
      String deviceToken) async {
    name = name;
    phone = phone;
    email = email;
    cityId = cityId;
    deviceToken = deviceToken;
    editProfile = await profileInfo.editProfile(
        cityId: cityId,
        name: name,
        phone: phone,
        email: email,
        deviceToken: deviceToken);
    box.remove("name");
    box.remove("phone");
    box.remove("email");
    box.write("name", name);
    box.write("phone", phone);
    box.write("email", email);
    update();
  }

  Future getSocialData() async {
    socialItems = await social.getSocial();
    snapchat = socialItems.snapchat;
    instagram = socialItems.instagram;
    whatsapp = socialItems.whatsapp;
    twitter = socialItems.twitter;
    update();
  }

  Future getFavorites() async {
    allFavorites = await favorites.showFavorites();
    if (allFavorites.statusCode == 200) {
      favData = allFavorites.body;
      favJsonData = jsonDecode(favData)["data"];
      favList = favJsonData.map((element) => element).toList();
    }
    update();
  }

  Future storeFavoritess(int id) async {
    await storeFavorites.storeFav(id);

    update();
  }

  Future deleteFavoritess(int id) async {
    iD = id;
    delete = await storeFavorites.deleteFav(id);
    if (delete.statusCode == 200) {
      print("$id is my id");
    }
    print(delete.body);
    print("trueeee");

    update();
  }

  Future getAdresses() async {
    allAdresses = await showAddresses.showAddresses();
    if (allAdresses.statusCode == 200) {
      addressData = allAdresses.body;
      addressesJson = jsonDecode(addressData)["data"];
      addressesList.value = addressesJson.map((element) => element).toList();

      print("addresses are $addressesList");
    }
  }

  Future deleteThisAddress(int id) async {
    deleteAddress = await addressProcesses.deleteAddress(id);
    if (deleteAddress.statusCode == 200) {
      await getAdresses();
      print("$id is my id");
      print("trueeee");
    } else {
      print("Noooo");
    }
    // print(delete.body);

    update();
  }

  Future showThisAddress(int id) async {
    showAddress = await showAddresses.showOneAddress(id);
    if (showAddress.statusCode == 200) {
      showAddressData = showAddress.body;
      showAddressJsonData = jsonDecode(showAddressData)['data'];
      print(showAddressJsonData['name']);
      await getAdresses();
      print("$id is my id");
      print("trueeee");
    } else {
      print("Noooo");
    }
    // print(delete.body);

    update();
  }

  Future editThisAddress(
      {required int id,
      required int cityId,
      required String state,
      required int buildingNumber,
      required int apartementNumber,
      required String locationText,
      required String address,
      required int isPrimary,
      required String name,
      required String phone}) async {
    editaddress = await editAddress.editAddress(
      id,
      cityId: cityId,
      state: state,
      buildingNumber: buildingNumber,
      apartementNumber: apartementNumber,
      locationText: locationText,
      address: address,
      isPrimary: isPrimary,
      name: name,
      phone: phone,
    );
    if (editaddress.statusCode == 200) {
      Get.defaultDialog(
          middleText: "تـم تعديل بياناتكم بنجاح",
          middleTextStyle:
              TextStyle(fontSize: 15, color: Color.fromARGB(240, 36, 36, 36)),
          title: "تـم",
          titleStyle:
              TextStyle(fontSize: 20, color: Color.fromARGB(240, 36, 36, 36)));
      await getAdresses();
      print("trueeee");
    } else {
      print("Noooo");
    }
    // print(delete.body);

    update();
  }

  Future createAddresss(
      {required int id,
      required String state,
      required int buildingNumber,
      required int apartementNumber,
      required String locationText,
      required int isPrimary,
      required String lat,
      required String lng,
      required String address}) async {
    createAddress = await createAddressService.createAddress(
        cityId: id,
        state: state,
        buildingNumber: buildingNumber,
        apartementNumber: apartementNumber,
        locationText: locationText,
        isPrimary: isPrimary,
        address: address,
        lat: lat,
        lng: lng);
    // print(jsonDecode(createAddress.body));
    print(jsonDecode(createAddress.body)["data"]);
    if (createAddress.statusCode == 200) {
      createAddressData = createAddress.body;
      createAddressJson = jsonDecode(createAddressData)["data"];
      await getAdresses();
    } else {
      print("faiiiiil");
    }
    update();
  }

  Future getAddressType() async {
    addressType = await createAddressService.addressType();
    if (addressType.statusCode == 200) {
      addressTypeData = addressType.body;
      addressTypeJsonData = jsonDecode(addressTypeData)['data'];
    }

    update();
  }

  launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
