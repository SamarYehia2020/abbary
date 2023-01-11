import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/appbar3_widget%20.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:abbar_app/view/widgets/sort_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/best_sells_widget.dart';

class SingleTradeScreen extends StatefulWidget {
  final brandInfo = Get.arguments;
  SingleTradeScreen({Key? key}) : super(key: key);

  @override
  State<SingleTradeScreen> createState() => _SingleTradeScreenState();
}

class _SingleTradeScreenState extends State<SingleTradeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    main_controller.getProductsByBrandsName(widget.brandInfo);
  }

  final main_controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar3Widget(
              title: Text(widget.brandInfo),
              icon1: SortWidget().build(context),
            ),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: GetBuilder<MainController>(
                  builder: (controller) => SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.fetchBrands.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .5,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) => SellsWidget(
                        imgUrl: controller.fetchBrands[index].mainImage,
                        // sell_product:,
                        title: controller.fetchBrands[index].title,
                        priceAfter: controller.fetchBrands[index].finalPrice,
                        id: controller.fetchBrands[index].id,
                        // priceBefore: trades[index]['priceBefore'],
                        // isFav: false,
                      ),
                    ),
                  ),
                ))));
  }
}
