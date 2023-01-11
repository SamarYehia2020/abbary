import 'package:abbar_app/controllers/cart_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(CartController());
  }
}
