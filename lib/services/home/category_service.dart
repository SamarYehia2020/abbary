import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/home/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<dynamic> fetchCategories() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/categories"),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data);
      // print(jsonData);

      Categories categories = Categories.fromJson(jsonData);
      List<SingleCategory> categoryList = categories.categoryList
          .map((e) => SingleCategory.fromJson(e))
          .toList();
      return categoryList;
    } else {
      return throw Exception("Categories not loaded");
    }
  }
}
