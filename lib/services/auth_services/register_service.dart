import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegisterServices {
  register({
    String? name,
    String? phone,
    String? email,
    int? cityId,
    String? password,
    String? password_confirmation,
  }) async {
    http.Response response = await http.post(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/auth/register"),
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'email': email,
          'city_id': cityId,
          'password': password,
          'password_confirmation': password_confirmation,
        }),
        headers: {
          "X-City": "$cityId",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
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

    //   print("Error : Status code is ${response.statusCode}");
    // }
  }
}

class ConfirmRegisterServices {
  GetStorage box = GetStorage();
  confirmRegister({
    String? code,
    String? deviceToken,
    String? phone,
  }) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/auth/code-confirm"),
        body: jsonEncode({
          'phone': phone,
          'code': code,
          'devices_token': deviceToken,
        }),
        headers: {
          "X-City": box.read("x-city").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else if (response.statusCode == 400) {
      print("faaaaaaail");
      // final res = jsonDecode(response.toString());
      // String message;
      // final device_verified = res['phone_verified'];
      // if (!device_verified) {
      //   message = res['message'];
      // } else if (!response.body.contains(device_verified)) {
      //   message = res['message'];
      // }
    }
    // else {
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
