import 'package:get/get.dart';

String state = '';

class OrderController extends GetxController {
  List<Map> orders = [
    {
      "Number": '#123',
      "Date": "6/4/2022",
      "Price": "46.60 ريال",
      "Imgurl": "assets/images/product.png",
      state: "جاري مراجعة طلبك"
    },
    {
      "Number": '#123',
      "Date": "6/4/2022",
      "Price": "46.60 ريال",
      "Imgurl": "assets/images/product.png",
      state: "جاري تجهيز وشحن طلبك"
    },
    {
      "Number": '#123',
      "Date": "6/4/2022",
      "Price": "46.60 ريال",
      "Imgurl": "assets/images/product.png",
      state: "جاري التوصيل"
    },
    {
      "Number": '#123',
      "Date": "6/4/2022",
      "Price": "46.60 ريال",
      "Imgurl": "assets/images/product.png",
      state: "تم التوصيل"
    },
    {
      "Number": '#123',
      "Date": "6/4/2022",
      "Price": "46.60 ريال",
      "Imgurl": "assets/images/product.png",
      state: "ملغي"
    },
  ];
}
