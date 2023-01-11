import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/orders.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CheckOutDoneScreen extends StatelessWidget {
  CheckOutDoneScreen({Key? key}) : super(key: key);
  TextEditingController phonecontroller = TextEditingController();
  TextInputType phonetextInput = TextInputType.phone;
  TextEditingController passcontroller = TextEditingController();
  TextInputType passtextInput = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
              title: Text("ملخص الطلب"),color: Colors.white,iconBgColor: Color(0xffF1F1F1),iconColor: ThemeApp.textColor
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(
                      LineAwesomeIcons.check_circle_1,
                      size: 100,
                      color: ThemeApp.lightGreen,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "تم استقبال طلبكم بنجاح",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "يمكنك الاطلاع علي تفاصيل الطلب عن طريق الذهاب الي صفحة طلباتي",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 20),
                  ButtonIconWidget(
                      title: Text("طلباتي"),
                      width: 350,
                      bacColor: ThemeApp.mainColor,
                      forColor: Colors.white,
                      onPress: () {
                        Get.to(() => OrdersScreen());
                      }),
                  SizedBox(height: 10),
                  ButtonIconWidget(
                      title: Text("الرجوع للرئيسيه"),
                      width: 350,
                      bacColor: Color(0xffE8F0F7),
                      forColor: ThemeApp.mainColor,
                      onPress: () {
                        Get.toNamed("/IndexScreen");
                      }),
                ],
              ),
            )));
  }
}
