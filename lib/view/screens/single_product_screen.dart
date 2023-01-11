import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar3_widget%20.dart';
import 'package:abbar_app/view/widgets/best_sells_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/sells_carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SingleProductScreen extends StatefulWidget {
  final pro_id = Get.arguments;
  SingleProductScreen({Key? key}) : super(key: key);

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  final main_controller = Get.find<MainController>();

  final account_controller = Get.find<AccountController>();

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main_controller.getProductById(widget.pro_id);
    account_controller.storeFavoritess(widget.pro_id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Appbar3Widget(
          icon1: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              size: 25,
              color: ThemeApp.textColor,
            ),
          ),
          icon2: Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(50)),
            child: GetBuilder<AccountController>(
              builder: (controller) => IconButton(
                onPressed: () async {
                  if (controller.clicked == false) {
                    controller.clicked = true;
                    await controller.storeFavoritess(widget.pro_id);
                    controller.getFavorites();
                  } else if (controller.clicked == true) {
                    controller.clicked = false;
                    await controller.deleteFavoritess(widget.pro_id);
                    controller.getFavorites();
                  }
                  print(widget.pro_id);
                  // print(account_controller.favList.length);
                },
                icon: controller.clicked
                    ? Icon(LineAwesomeIcons.heart_1)
                    : Icon(
                        LineAwesomeIcons.heart,
                        size: 25,
                        color: ThemeApp.textColor,
                      ),
              ),
            ),
          )),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBuilder<MainController>(
          builder: (controller) => SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Image.network(
                  controller.fetchProductId!.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                controller.fetchProductId!.title,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: ThemeApp.lightTextColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(controller.fetchProductId!.id.toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: ThemeApp.lightGreen,
                      )),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    controller.fetchProductId!.finalPrice.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    controller.fetchProductId!.originalPrice.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(controller.fetchProductId!.description,
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Color(0xfff1f1f1), width: 2)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe3e3e3)),
                            child: InkWell(
                              onTap: () {
                                controller.increment();
                              },
                              child: Icon(Icons.add,
                                  color: ThemeApp.lightTextColor),
                            ),
                          ),
                          Text(
                            controller.proItems.toString(),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffe3e3e3)),
                            child: InkWell(
                              onTap: () {
                                controller.decrement();
                              },
                              child: Icon(Icons.remove,
                                  color: ThemeApp.lightTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ButtonIconWidget(
                          title: Row(
                            children: [
                              Icon(LineAwesomeIcons.shopping_cart),
                              SizedBox(
                                width: 5,
                              ),
                              Text("اضافه للسله")
                            ],
                          ),
                          bacColor: ThemeApp.mainColor,
                          forColor: Colors.white,
                          onPress: () {

                            Get.bottomSheet(Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(70),
                                      topRight: Radius.circular(70)),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تم اضافة المنتج مياه بيرين 1.5 لتر الي سلة الشراء بنجاح",
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Row(
                                          children: [
                                            ButtonIconWidget(
                                                title: Text("متابعة التسوق"),
                                                width: 150,
                                                bacColor: Color(0xffE8F0F7),
                                                forColor: ThemeApp.mainColor,
                                                onPress: () {}),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            ButtonIconWidget(
                                                title: Text("أتمام الشراء"),
                                                width: 150,
                                                bacColor: ThemeApp.mainColor,
                                                forColor: Colors.white,
                                                onPress: () {})
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ));
                          },
                          width: 150),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "منتجات مشابهه",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SellsSliderWidget(),
            ],
          )),
        ),
      ),
    ));
  }
}
