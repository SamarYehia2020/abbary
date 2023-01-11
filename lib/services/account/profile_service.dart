import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/account/profile_model.dart';
import 'package:abbar_app/view/screens/my_personal_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  GetStorage box = GetStorage();
  Future<dynamic> editProfile(
      {required int? cityId,
      required String? name,
      required String? phone,
      required String? email,
      required String? deviceToken}) async {
    http.Response response = await http
        .post(Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/profile"),
            body: jsonEncode({
              'phone': phone,
              'email': email,
              'city_id': cityId,
              'devices_token': deviceToken,
              'name': name
            }),
            headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // var data = response.body;

    if (response.statusCode == 200) {
      Get.bottomSheet(
        Center(
            child: Text(
          "Your Personal Data changed Successfully",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xffffffff), fontSize: 20),
        )),
        isDismissible: true,
      );
      // print(response.statusCode);
      // print('Response body: ${response.body}');

      // var jsonData = jsonDecode(data)['data'];

      // ProfileModel profileInfo = ProfileModel.fromJson(jsonData);
      // print(profileInfo.email);
      // print(response.statusCode);

      // return profileInfo;
    } else
      return throw Exception("dfdsfsd");
  }
}
