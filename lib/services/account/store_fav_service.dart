import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StoreFavorites {
  GetStorage box = GetStorage();
  Future<dynamic> storeFav(id) async {
    http.Response response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            "https://abary.tasawk.net/rest-api/ecommerce/favorites/items/$id"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;
  }

  Future<dynamic> deleteFav(id) async {
    http.Response response = await http.delete(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            "https://abary.tasawk.net/rest-api/ecommerce/favorites/items/$id"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    return response;
  }
}
