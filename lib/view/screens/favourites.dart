import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/controllers/orders_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/best_sells_widget.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Map> favouriteList = [
    {
      "productImg": "assets/images/product.png",
      "productItem": "مياه بيرين 1.5 لتر",
      "productTitle": "بيرين",
      "priceAfter": "1.90 ريال",
      "priceBefore": "2.25"
    },
    {
      "productImg": "assets/images/product.png",
      "productItem": "مياه بيرين 1.5 لتر",
      "productTitle": "بيرين",
      "priceAfter": "1.90 ريال",
      "priceBefore": "2.25"
    },
    {
      "productImg": "assets/images/product.png",
      "productItem": "مياه بيرين 1.5 لتر",
      "productTitle": "بيرين",
      "priceAfter": "1.90 ريال",
      "priceBefore": "2.25"
    },
    {
      "productImg": "assets/images/product.png",
      "productItem": "مياه بيرين 1.5 لتر",
      "productTitle": "بيرين",
      "priceAfter": "1.90 ريال",
      "priceBefore": "2.25"
    },
  ];

  final account_controller = Get.find<AccountController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    account_controller.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("المفضله"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: GetBuilder<AccountController>(
              builder: (controller) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: controller.favList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) => SellsWidget(
                      imgUrl: controller.favList[index]["main_image"],
                      sell_product: controller.favList[index]["description"],
                      title: controller.favList[index]["title"],
                      priceAfter: controller.favList[index]["final_price"],
                      priceBefore: controller.favList[index]["original_price"],
                      id: controller.favList[index]["id"],
                      // isFav: false,
                    ),
                  )),
            )));
  }
}
