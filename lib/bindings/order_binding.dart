import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:abbar_app/controllers/orders_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
