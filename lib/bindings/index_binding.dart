import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:abbar_app/controllers/index_controller.dart';
import 'package:get/get.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexController());
    Get.put(GiftController());
  }
}
