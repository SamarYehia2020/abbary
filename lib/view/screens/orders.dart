import 'package:abbar_app/controllers/orders_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/orders_single.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final order_controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("طلباتي"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                    child: Container(
                        child: GetBuilder<OrderController>(
                  builder: (controller) => Column(
                    children: List.generate(
                        order_controller.orders.length,
                        (index) => InkWell(
                              onTap: () {
                                Get.to(() => OrderSingleScreen());
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xfff1f1f1),
                                            width: 3))),
                                child: Row(children: [
                                  Image.asset(
                                    order_controller.orders[index]['Imgurl'],
                                    fit: BoxFit.fill,
                                    width: 80,
                                    height: 90,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                order_controller.orders[index]
                                                    ['Number'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                                order_controller.orders[index]
                                                    ['Date'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        if (order_controller.orders[index]
                                                [state] ==
                                            "تم التوصيل")
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.green),
                                            child: Text(
                                              order_controller.orders[index]
                                                  [state],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        if (order_controller.orders[index]
                                                [state] ==
                                            "جاري التوصيل")
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Color(0xffB8E986)),
                                            child: Text(
                                              order_controller.orders[index]
                                                  [state],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        if (order_controller.orders[index]
                                                [state] ==
                                            "جاري مراجعة طلبك")
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Color(0xffF5BE23)),
                                            child: Text(
                                              order_controller.orders[index]
                                                  [state],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        if (order_controller.orders[index]
                                                [state] ==
                                            "جاري تجهيز وشحن طلبك")
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Color(0xff50E3C2)),
                                            child: Text(
                                              order_controller.orders[index]
                                                  [state],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        if (order_controller.orders[index]
                                                [state] ==
                                            "ملغي")
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Color(0xff9B9B9B)),
                                            child: Text(
                                              order_controller.orders[index]
                                                  [state],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          order_controller.orders[index]
                                              ['Price'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            )),
                  ),
                ))))));
  }
}
