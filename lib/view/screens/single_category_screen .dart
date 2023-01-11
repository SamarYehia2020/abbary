import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/single_product_screen.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/appbar3_widget%20.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:abbar_app/view/widgets/sort_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/best_sells_widget.dart';

class SingleCategoryScreen extends StatefulWidget {
  final arg = Get.arguments;
  // GetStorage box = GetStorage();

  SingleCategoryScreen({Key? key}) : super(key: key);

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main_controller.getProducts(widget.arg);
  }

  final main_controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar3Widget(
        title: Text(widget.arg),
        icon1: SortWidget().build(context),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<MainController>(builder: (controller) {
            // if (controller.productList == null) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // } else if (controller.productList.isEmpty) {
            //   return Center(
            //     child: Text("empty"),
            //   );
            // }

            return SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.fetchproduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return SellsWidget(
                    imgUrl: main_controller.fetchproduct[index].mainImage,
                    // sell_product: main_controller.fetchproduct[index].category,
                    title: controller.fetchproduct[index].title,
                    priceAfter: controller.fetchproduct[index].finalPrice,
                    priceBefore: controller.fetchproduct[index].originalPrice,
                    quantity: controller.fetchproduct[index].quantity,
                    id: controller.fetchproduct[index].id,

                    // isFav: false,
                  );
                },
              ),
            );
          })),
    ));
  }
}
