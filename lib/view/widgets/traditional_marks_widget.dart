import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/product_item_widget.dart';
import 'package:abbar_app/view/widgets/trade_mark_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TraditionalMarksWidget extends StatelessWidget {
  bool isshrinked;
  TraditionalMarksWidget({required this.isshrinked, Key? key})
      : super(key: key);
  final main_controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: GetBuilder<MainController>(
            builder: (controller) =>
                // if (snapshot.hasData) {
                //   List<dynamic> dataa = snapshot.data as List;
                //   List<String> dataImage =
                //       List.generate(dataa.length, (index) => dataa[index].imgUrl);
                //   List<String> dataName =
                //       List.generate(dataa.length, (index) => dataa[index].name);
                //   List<int> dataId =
                //       List.generate(dataa.length, (index) => dataa[index].id);

                GridView.builder(
                    physics: isshrinked ? NeverScrollableScrollPhysics() : null,
                    shrinkWrap: isshrinked,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .8,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: main_controller.brandItem.length,
                    itemBuilder: (context, index) => TradeItemWidget(
                        // id: main_controller.brandItem[index].id,
                        imgUrl: main_controller.brandItem[index].imgUrl,
                        tradeTitle: main_controller.brandItem[index].name))));
  }
}
