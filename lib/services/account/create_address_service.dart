import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/account/profile_model.dart';
import 'package:abbar_app/view/screens/my_personal_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CreateAddressService {
  GetStorage box = GetStorage();
  Future<dynamic> createAddress({
    required int cityId,
    required String state,
    required int buildingNumber,
    required int apartementNumber,
    required String locationText,
    Map<String, dynamic>? location,
    String? lat,
    String? lng,
    String? address,
    int? isPrimary,
  }) async {
    http.Response response = await http.post(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/profile/addresses"),
        body: jsonEncode({
          'city_id': cityId,
          'state': state,
          'building_number': buildingNumber,
          'apartment_number': apartementNumber,
          'location_text': locationText,
          'is_primary': isPrimary,
          'map_location': {
            'lat': lat,
            'lng': lng,
            'address': address,
          },
        }),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // var data = response.body;

    return response;
  }

  Future<dynamic> addressType() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/address-types"),
        headers: {
          "X-Api-Token": box.read("apiToken"),
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    // var data = response.body;

    return response;
  }
}
