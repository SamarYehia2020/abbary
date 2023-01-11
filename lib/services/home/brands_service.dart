import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/home/brand_model.dart';
import 'package:http/http.dart' as http;

class BrandsService {
  Future<dynamic> fetchBrands() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/brands"),
        headers: {
          "X-City": "8",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data);
      BrandsList brands = BrandsList.fromJson(jsonData);
      List<SingleBrand> brand_list =
          brands.brandList.map((e) => SingleBrand.fromJson(e)).toList();
      return brand_list;
    }
  }
}
