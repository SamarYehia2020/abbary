import 'dart:convert';
import 'dart:io';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactUsServices {
  contactUs({String? name, String? phone, String? email, String? msg}) async {
    http.Response response = await http.post(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/contact-us"),
        body: jsonEncode(
            {'phone': phone, 'name': name, 'email': email, 'message': msg}),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // final res = jsonDecode(response.toString());
    String message;
    final res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      message = res['message'];
      Get.defaultDialog(
        title: "تم الارسال",
        content: Text(
          message,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'TajwalBold',
          ),
        ),
        backgroundColor: ThemeApp.mainColor.withOpacity(.8),
        titlePadding: EdgeInsets.all(20),
        titleStyle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'TajwalBold',
        ),
      );
    } else {
      message = res['message'];
      Get.defaultDialog(
        title: "اعد كتابة البيانات",
        content: Text(
          message,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'TajwalBold',
          ),
        ),
        cancel: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () => Get.back(),
          child: Text("Ok",
              style: TextStyle(
                color: ThemeApp.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'TajwalBold',
              )),
        ),
        backgroundColor: ThemeApp.mainColor.withOpacity(.8),
        titlePadding: EdgeInsets.all(20),
        titleStyle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'TajwalBold',
        ),
      );
    }
  }
}
