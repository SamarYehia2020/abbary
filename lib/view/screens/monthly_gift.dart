import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/gift_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MonthlyGiftScreen extends StatelessWidget {
  MonthlyGiftScreen({Key? key}) : super(key: key);
  final gift_controller = Get.find<GiftController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: 320,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Group_12896.png"))),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "منتجات هذا الشهر",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.white),
                        ),
                        Obx(
                          () => Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (gift_controller.sliderVal.value.ceil())
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      "40",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                LinearPercentIndicator(
                                  lineHeight: 7.0,
                                  isRTL: true,
                                  percent: gift_controller.sliderVal.value / 40,
                                  backgroundColor:
                                      Color.fromARGB(255, 6, 3, 173),
                                  progressColor: ThemeApp.lightGreen,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "اجمع ${(gift_controller.fullVal.value - gift_controller.sliderVal.value).ceil().toString()} منتج اضاقي لنتمكن من الحصول علي هديتك الجديده",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              GetBuilder<GiftController>(
                builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: gift_controller.gifts.length,
                    itemBuilder: (context, index) => GiftWidget(
                        title: gift_controller.gifts[index]['title'],
                        code: gift_controller.gifts[index]['code'],
                        imgUrl: gift_controller.gifts[index]['imgUrl'])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
