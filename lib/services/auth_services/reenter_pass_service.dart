import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReenterPassService {
  rePass(
      {required String phone,
      required String password,
      required String passwordConfirmation,
      required String deviceToken,
      required String code}) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/auth/new-password"),
        body: jsonEncode({
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'devices_token': deviceToken,
          'code': code
        }),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

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

class ConfirmReenterPassService {
  confirmRenterPass(
      {required String code,
      required String deviceToken,
      required String phone}) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/auth/code-confirm"),
        body: jsonEncode({
          'phone': phone,
          'code': code,
          'devices_token': deviceToken,
        }),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    // } else if (response.statusCode == 400) {
    //   final res = jsonDecode(response.toString());
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
