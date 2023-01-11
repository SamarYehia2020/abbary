import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/auth/cities_model.dart';
import 'package:abbar_app/models/auth/city_model.dart';
import 'package:http/http.dart' as http;

class CityService {
  Future<List<CityModel>> cityInfo() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/cities"),
        headers: {
          "X-City": "1",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    var data = response.body;

    var jsonData = jsonDecode(data);
    Cities cities = Cities.fromJson(jsonData);
    List<CityModel> cityList =
        cities.cities.map((e) => CityModel.fromJson(e)).toList();
    return cityList;
  }
}
