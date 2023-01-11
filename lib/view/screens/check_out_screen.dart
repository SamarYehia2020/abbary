import 'package:abbar_app/controllers/orders_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/checkout_done_screen.dart';
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

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);
  final order_controller = Get.find<OrderController>();
  TextEditingController daycontroller = TextEditingController();
  TextInputType daytextInput = TextInputType.text;
  TextEditingController clockcontroller = TextEditingController();
  TextInputType clocktextInput = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("انهاء الطلب"),
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
                                            .copyWith(height: 1.5)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ButtonIconWidget(
                                        title: Text("تغيير العنوان"),
                                        width: 150,
                                        bacColor: Color(0xffE8F0F7),
                                        forColor: ThemeApp.mainColor,
                                        onPress: () {})
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
                                      "الموعد المناسب للتوصيل",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              height: 2, color: Colors.black),
                                    ),
                                    TextFormWidget(
                                      title: "حدد اليوم",
                                      controller: daycontroller,
                                      textInput: daytextInput,
                                      obsecure: false,
                                      suffix: InkWell(
                                        onTap: () {},
                                        child: Icon(LineAwesomeIcons.calendar),
                                      ),
                                    ),
                                    TextFormWidget(
                                      title: "حدد الساعه",
                                      controller: clockcontroller,
                                      textInput: clocktextInput,
                                      obsecure: false,
                                      suffix: InkWell(
                                        onTap: () {},
                                        child: Icon(LineAwesomeIcons.clock),
                                      ),
                                    ),
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
                                        "يرجي اختيار طريقة الدفع لاكمال عملية الشراء",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                height: 2, color: Colors.black),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xfff1f1f1),
                                                width: 2)),
                                        child: ListTile(
                                          horizontalTitleGap: -5,
                                          contentPadding: EdgeInsets.all(0),
                                          title: Text("فيرنا-ماستركارد"),
                                          leading: Radio(
                                              value: 0,
                                              groupValue: 0,
                                              onChanged: (val) {}),
                                          trailing: Container(
                                            width: 70,
                                            height: 30,
                                            child: Image.asset(
                                                "assets/images/visa.png"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xfff1f1f1),
                                                width: 2)),
                                        child: ListTile(
                                          horizontalTitleGap: -5,
                                          contentPadding: EdgeInsets.all(0),
                                          title:
                                              Text("الدفع عند الاستلام(مدي)"),
                                          leading: Radio(
                                              value: 1,
                                              groupValue: 0,
                                              onChanged: (val) {}),
                                          trailing: Container(
                                            width: 70,
                                            height: 30,
                                            child: Image.asset(
                                                "assets/images/cash.png"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xfff1f1f1),
                                                width: 2)),
                                        child: ListTile(
                                          horizontalTitleGap: -5,
                                          contentPadding: EdgeInsets.all(0),
                                          title:
                                              Text("الدفع عند الاستلام(شبكه)"),
                                          leading: Radio(
                                              value: 2,
                                              groupValue: 0,
                                              onChanged: (val) {}),
                                          trailing: Container(
                                            width: 70,
                                            height: 30,
                                            child: Image.asset(
                                                "assets/images/mada.png"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: double.infinity,
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "كوبون خصم(ان وجد)",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              height: 3, color: Colors.black),
                                    ),
                                    TextFormWidget(
                                      title: "ادخل رقم الكوبون هنا",
                                      controller: clockcontroller,
                                      textInput: clocktextInput,
                                      obsecure: false,
                                      suffix: InkWell(
                                        onTap: () {},
                                        child: ButtonIconWidget(
                                            title: Text("تفعيل الكوبون"),
                                            width: 50,
                                            bacColor: ThemeApp.mainColor,
                                            forColor: Colors.white,
                                            onPress: () {}),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
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
                                                      .headline4!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("24",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
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
                                                      .headline4!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("45.60 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
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
                                                      .headline4!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("6.64 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
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
                                                      .headline4!
                                                      .copyWith(
                                                        height: 1.5,
                                                      )),
                                              Text("20.0 ريال",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
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
                                          ButtonIconWidget(
                                              title: Text("اتمام الطلب"),
                                              width: double.infinity,
                                              bacColor: ThemeApp.mainColor,
                                              forColor: Colors.white,
                                              onPress: () {
                                                Get.to(
                                                    () => CheckOutDoneScreen());
                                              }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]))))));
  }
}
