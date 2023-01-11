import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/account/about_model.dart';
import 'package:abbar_app/models/account/policy_model.dart';
import 'package:http/http.dart' as http;

class ConditionsService {
  Future<dynamic> getConditions() async {
    http.Response response = await http.get(
        Uri.parse("https://abary.tasawk.net/rest-api/ecommerce/terms-of-use"),
        headers: {
          "X-City": "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });

    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(data)['data'];
      // print(jsonData);
      ConditionsModel conditionsModel = ConditionsModel.fromJson(jsonData);
      print(jsonData);

      // String singleData = aboutModel.content!;
      // print(singleData);

      return conditionsModel;
    }
  }
}
