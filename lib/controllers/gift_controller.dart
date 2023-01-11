import 'package:get/get.dart';

class GiftController extends GetxController {
  List<Map> gifts = [
    {
      "imgUrl": "assets/images/logo.png",
      "title": "كود خصم من اباري بقيمة 5% علي طلبات التقدم",
      "code": "0C2022"
    },
    {
      "imgUrl": "assets/images/logo.png",
      "title": "كود خصم من اباري بقيمة 5% علي طلبات التقدم",
      "code": "0C2021"
    },
    {
      "imgUrl": "assets/images/logo.png",
      "title": "كود خصم من اباري بقيمة 5% علي طلبات التقدم",
      "code": "0C2020"
    }
  ];
  RxDouble sliderVal = 17.0.obs;
  RxDouble fullVal = 40.0.obs;
}
