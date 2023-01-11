import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ShowAddresses {
  GetStorage box = GetStorage();
  Future<dynamic> showAddresses() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    // print(" body is ======> ${response.body}");
    return response;
  }

  Future<dynamic> showOneAddress(int id) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses/$id"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    // print(" body is ======> ${response.body}");
    return response;
  }
}
