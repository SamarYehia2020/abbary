import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/home/most_sells.dart';
import 'package:abbar_app/models/home/single_product_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  GetStorage box = GetStorage();
  Future<dynamic> fetchProducts() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/shop/product"),
        headers: {
          "X-City": box.read("cityId").toString(),
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data);
      var myData = jsonData["data"];

      ProductsList products = ProductsList.fromJson(jsonData);
      List<SingleProductModel> productsList = products.productsList!
          .map((e) => SingleProductModel.fromJson(e))
          .toList();
      print(productsList[0].categories[0]["name"]);
      print(data);
      return productsList;
    } else
      throw Exception("faiiiled");
  }
}
