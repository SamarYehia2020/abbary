import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/others/social_media_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SocialMediaService {
  GetStorage box = GetStorage();
  Future<dynamic> getSocial() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://abary.tasawk.net/rest-api/ecommerce/settings/social-media"),
        headers: {
          "X-Api-Token": box.read("auth") == true
              ? box.read("apiToken")
              : "tChPUBczxeE89RvOccdRjm9oIV8AjThPVrSSgNEs0ZqhCBdxwE2f1UxVOGRT",
          "X-City":
              box.read("auth") == true ? box.read("cityId").toString() : "10",
          HttpHeaders.acceptHeader: 'application/jsons',
          HttpHeaders.contentTypeHeader: 'application/jsons',
        });
    var data = response.body;
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = jsonDecode(data)['data'];
      // var socialData = jsonData;
      SocialMediaModel socialMediaModel = SocialMediaModel.fromJson(jsonData);
      print(jsonData);
      return socialMediaModel;
    } else {
      print("faiiil");
    }
  }
}
