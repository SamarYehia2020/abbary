import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:get/get.dart';

class GiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GiftController());
  }
}
