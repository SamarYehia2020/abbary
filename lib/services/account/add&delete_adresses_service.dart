import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddressProcesses {
  GetStorage box = GetStorage();
  Future<dynamic> editAddress(id) async {
    http.Response response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses/$id"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;
  }

  Future<dynamic> deleteAddress(id) async {
    http.Response response = await http.delete(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses/$id"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;
  }
}
