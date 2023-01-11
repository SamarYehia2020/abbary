import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPassService {
  forgot({
    required String phone,
  }) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/auth/forget-password"),
        body: jsonEncode({
          'phone': phone,
          'city_id': 10,
        }),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // final res = jsonDecode(response.toString());
    // String message;
    // final res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      print('faiiiiil');
    } //   message = res['message'];

    //   if (res.containsKey('phone_verified')) {
    //     print(message);
    //   } else {
    //     print(message);
    //   }
    //   print(res);
    //   print('Response status: ${response.statusCode}');
    // }
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
