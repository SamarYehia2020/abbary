import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/single_trademark_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradeItemWidget extends StatelessWidget {
  String imgUrl;
  String tradeTitle;
  int? id;
  TradeItemWidget(
      {this.id, required this.imgUrl, required this.tradeTitle, Key? key})
      : super(key: key);
  final main_controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => SingleTradeScreen(), arguments: tradeTitle);
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: ThemeApp.lightTextColor)),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            tradeTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        )
      ],
    );
  }
}
