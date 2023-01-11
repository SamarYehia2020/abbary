import 'package:abbar_app/controllers/orders_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/check_out_screen.dart';
import 'package:abbar_app/view/screens/orders_single.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/cart_widget.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class OrderSingleScreen extends StatelessWidget {
  OrderSingleScreen({Key? key}) : super(key: key);
  final order_controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("#123"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                    child: Container(
                        color: Color(0xfff1f1f1),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  LineAwesomeIcons.tag,
                                                  color: ThemeApp.mainColor,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "حالة الطلب",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.orange),
                                            child: Text(
                                              "جاري التوصيل",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  LineAwesomeIcons.calendar,
                                                  color: ThemeApp.mainColor,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "تاريخ الطلب",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Text("6/4/2022",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  LineAwesomeIcons.credit_card,
                                                  color: ThemeApp.mainColor,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "طريقة الدفع",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text("مدي",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Image.asset(
                                                    "assets/images/mada.png")
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "بيانات التوصيل",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              height: 2, color: Colors.black),
                                    ),
                                    Text("عبدالله صالح",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              height: 1.5,
                                            )),
                                    Text(
                                        "شارع صلاح الدين الايوبي-المنز-خلف البنك الاهلي 43",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(height: 1.5)),
                                    Text("045000000000",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(height: 1.5))
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "تقييم الطلب",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              height: 2, color: Colors.black),
                                    ),
                                    TextFormField(
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF1F1F1),
                                          filled: true,
                                          hintText: "أضف نص التقييم",
                                          hintStyle: TextStyle(
                                              color: Color(0xff9B9B9B),
                                              fontSize: 14,
                                              fontFamily: 'TajwalMedium',
                                              fontWeight: FontWeight.w500),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Color(0xffF1F1F1),
                                                width: 0.0),
                                          ),
                                          enabled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        )),
                                    Text("أضف علامات التقييم",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(height: 1.5)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 2.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 25,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        ButtonIconWidget(
                                          title: Text("تقييم التطبيق"),
                                          bacColor: Color(0xffE8F0F7),
                                          forColor: ThemeApp.mainColor,
                                          onPress: () {},
                                          width: 120,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "تقييم الطلب",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                height: 2, color: Colors.black),
                                      ),
                                      ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (_, index) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    width: 100,
                                                    height: 100,
                                                    child: Image.asset(
                                                      "assets/images/product.png",
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "مياه بيرين 1.5 لتر",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text("بيرين",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6!
                                                                  .copyWith(
                                                                    color: ThemeApp
                                                                        .lightGreen,
                                                                  )),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("x1",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline6),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "1.90 ريال",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline3,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                          separatorBuilder: (_, index) =>
                                              Divider(),
                                          itemCount: 4),
                                    ],
                                  )),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "الاجمالي",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              height: 5, color: Colors.black),
                                    ),
                                    Container(
                                      height: 200,
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("اجمالي الكميه",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("24",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("الاجمالي بدون الضريبه",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("45.60 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("الضريبه(15%)",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("6.64 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("رسوم التوصيل",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("20.0 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        height: 1.5,
                                                      ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "الاجمالي المستحق",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              ),
                                              Text(
                                                "72.0 ريال",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ButtonIconWidget(
                                                  title: Text("اتمام الشراء"),
                                                  width: 130,
                                                  bacColor: ThemeApp.mainColor,
                                                  forColor: Colors.white,
                                                  onPress: () {
                                                    Get.to(
                                                        () => CheckOutScreen());
                                                  }),
                                              ButtonIconWidget(
                                                  title: Text("ابلاغ عن طلب"),
                                                  width: 130,
                                                  bacColor: Color(0xffE8F0F7),
                                                  forColor: ThemeApp.mainColor,
                                                  onPress: () {
                                                    Get.bottomSheet(Container(
                                                      height: 300,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          70),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          70)),
                                                          color: Colors.white),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "ابلاغ عن طلب",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline2,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    20),
                                                            child:
                                                                TextFormField(
                                                                    maxLines: 4,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      fillColor:
                                                                          Color(
                                                                              0xffF1F1F1),
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          "ادخل نص وصف البلاغ لا يقل عن 250",
                                                                      hintStyle: TextStyle(
                                                                          color: Color(
                                                                              0xff9B9B9B),
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily:
                                                                              'TajwalMedium',
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Color(0xffF1F1F1),
                                                                            width: 0.0),
                                                                      ),
                                                                      enabled:
                                                                          true,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                    )),
                                                          ),
                                                          ButtonIconWidget(
                                                              title:
                                                                  Text("ارسال"),
                                                              width: 320,
                                                              bacColor: ThemeApp
                                                                  .mainColor,
                                                              forColor:
                                                                  Colors.white,
                                                              onPress: () {})
                                                        ],
                                                      ),
                                                    ));
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]))))));
  }
}
