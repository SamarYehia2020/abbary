import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/account/about_model.dart';
import 'package:http/http.dart' as http;

class AboutService {
  Future<dynamic> about() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/about-us"),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data)['data'];
      // print(jsonData);
      AboutModel aboutModel = AboutModel.fromJson(jsonData);
      print(jsonData);

      // String singleData = aboutModel.content!;
      // print(singleData);

      return aboutModel;
    }
  }
}
