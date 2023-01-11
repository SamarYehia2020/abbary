import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryWidget extends StatelessWidget {
  ProductCategoryWidget({Key? key}) : super(key: key);
  final main_controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: FutureBuilder<dynamic>(
          future: main_controller.getCatItem(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> dataa = snapshot.data as List<dynamic>;
              List<String> dataImage =
                  List.generate(dataa.length, (index) => dataa[index].image);
              List<String> dataName =
                  List.generate(dataa.length, (index) => dataa[index].name);
              List<int> dataId =
                  List.generate(dataa.length, (index) => dataa[index].id);

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .9,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: dataa.length,
                  itemBuilder: (context, index) => ProductItemWidget(
                      // pId: dataId[index],
                      imgUrl: dataImage[index],
                      productTitle: dataName[index]));
            } else
              return throw Exception("faiiiil");
          }),
    );
  }
}
