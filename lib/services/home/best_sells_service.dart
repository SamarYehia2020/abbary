import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/home/most_sells.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BestSellsService {
  GetStorage box = GetStorage();
  Future<dynamic> fetchBestSells() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/shop/product/bestseller"),
        headers: {
          "X-City":
              box.read("auth") == true ? box.read("cityId").toString() : "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data);
      // print(jsonData["data"][0]["brand"]["description"].runtimeType);

      TheMostSellsListProduct mostSellsProducts =
          TheMostSellsListProduct.fromJson(jsonData);
      List<dynamic> theMostSellsList = mostSellsProducts.theMostSellsList!
          .map((e) => TheMostSellsSingleProduct.fromJson(e))
          .toList();
      return theMostSellsList;
    } else
      throw Exception("faiiiled");
  }
}
