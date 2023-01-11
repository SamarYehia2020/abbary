import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/single_category_screen%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemWidget extends StatelessWidget {
  String imgUrl;
  String productTitle;
  int? pId;
  ProductItemWidget(
      {required this.imgUrl, required this.productTitle, this.pId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => SingleCategoryScreen(), arguments: productTitle);
          },
          child: Container(
            width: 150,
            height: 150,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Color(0xffE8F0F7),
            child: Image.network(imgUrl),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            productTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // Text(id.toString())
      ],
    );
  }
}
