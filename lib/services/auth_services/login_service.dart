import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  GetStorage box = GetStorage();
  int? city_id;
  login({
    String? phone,
    String? password,
  }) async {
    http.Response response = await http.post(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/auth/sign-in"),
        body: jsonEncode({
          'phone': phone,
          'city_id': box.read("x-city"),
          'password': password,
        }),
        headers: {
          "X-City": box.read("x-city").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // final res = jsonDecode(response.toString());
    return response;

    // } else {
    //   String message;
    //   final device_verified = res['phone_verified'];
    //   if (!device_verified) {
    //     message = res['message'];
    //   } else if (!response.body.contains(device_verified)) {
    //     message = res['message'];
    //   }
    // }
    //  else {
    //   final res = jsonDecode(response.toString());
    //   final errorsMap = res['errors'];
    //   String message;
    //   if (errorsMap.isEmpty) {
    //     message = res['message'];
    //   } else {
    //     message = errorsMap[errorsMap.keys.first]!;
    //   }
    //   print(message);

    //   print("Error : Status code is ${response.statusCode}");
    // }
  }
}
