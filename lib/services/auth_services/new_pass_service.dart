import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NewPassService {
  GetStorage box = GetStorage();

  newPass({
    required String oldPass,
    required String newPassword,
    required String newPasswordConfirmation,
    required String deviceToken,
  }) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/profile/update-password"),
        body: jsonEncode({
          'old_password': oldPass,
          'password': newPassword,
          'password_confirmation': newPasswordConfirmation,
          'devices_token': deviceToken,
        }),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      print(response.statusCode);
      // if (oldPass == box.read("pass")) {
      //   // print('Response status: ${response.statusCode}');

      //   // box.remove("pass");
      //   // box.write("pass", newPassword);
      //   // print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      // }
    } else {
      print("faiiiil");
    }
    // } else {
    //   final res = jsonDecode(response.toString());
    //   final errorsMap = res['errors'];
    //   String message;
    //   if (errorsMap.isEmpty) {
    //     message = res['message'];
    //   } else {
    //     message = errorsMap[errorsMap.keys.first]!;
    //   }
    //   print(message);

    // print("Error : Status code is ${response.statusCode}");
    // }
  }
}
