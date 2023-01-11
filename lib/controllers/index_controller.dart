import 'package:get/get.dart';

class IndexController extends GetxController {
  int currentIndex = 0;

  bool ischanged = false;
  void replacement() {
    ischanged = !ischanged;
    update();
  }
}
