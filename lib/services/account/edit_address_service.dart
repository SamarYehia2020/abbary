import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class EditAddress {
  GetStorage box = GetStorage();
  Future<dynamic> editAddress(int id,
      {required int cityId,
      required String state,
      required int buildingNumber,
      required int apartementNumber,
      required String locationText,
      Map<String, dynamic>? location,
      String? lat,
      String? lng,
      required String address,
      required int isPrimary,
      required String name,
      required String phone}) async {
    http.Response response = await http.put(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses/$id"),
        body: jsonEncode({
          'city_id': cityId,
          'state': state,
          'building_number': buildingNumber,
          'apartment_number': apartementNumber,
          'location_text': locationText,
          'is_primary': isPrimary,
          '_map_location': {
            'lat': lat,
            'lng': lng,
            'address': address,
          },
          '_name': name,
          '_phone': phone
        }),
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
