import 'dart:convert';
import 'dart:io';

import 'package:abbar_app/models/home/slider_model.dart';
import 'package:http/http.dart' as http;

class SliderService {
  Future<dynamic> fetchSlider() async {
    String baseUrl = "https://abary.tasawk.net/rest-api/ecommerce/sliders";
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      "X-City": "10",
      HttpHeaders.acceptHeader: 'application/jsons',
      HttpHeaders.contentTypeHeader: 'application/jsons',
    });
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      ListSlider sliders = ListSlider.fromJson(jsonData);
      List<dynamic> sliderList =
          sliders.sliderList.map((e) => SingleSlider.fromJson(e)).toList();
      return sliderList;
    } else {
      return throw Exception("Faild to Load Slider");
    }
  }
}
