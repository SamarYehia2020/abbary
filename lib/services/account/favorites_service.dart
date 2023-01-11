import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ShowFavorites {
  GetStorage box = GetStorage();
  Future<dynamic> showFavorites() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/favorites/items"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;
  }
}
