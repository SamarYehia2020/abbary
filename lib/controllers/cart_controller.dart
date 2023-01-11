import 'package:abbar_app/database/cart_db.dart';
import 'package:abbar_app/view/screens/cart_screen.dart';
import 'package:abbar_app/view/screens/index_screen.dart';
import 'package:abbar_app/view/widgets/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartDb cartDb = CartDb();
  int count = 0;
  List items = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcount();
    getItems();
  }

  Future getcount() async {
    count = await cartDb.countData();
    print(count);
    update();
  }

  Future getItems() async {
    List<dynamic> response = await cartDb.readData("SELECT * FROM items");
    items.addAll(response);
    print(response);

    update();
  }

  Future deleteItem(int id) async {
    int response =
        await cartDb.deleteData("DELETE FROM items WHERE cart_id=$id");

    // if (response > 0) {
    Get.defaultDialog(content: Text("deleted"));
    // }
    print(response);

    update();
  }
}
