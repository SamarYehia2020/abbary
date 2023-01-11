import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpDoneScreen extends StatelessWidget {
  SignUpDoneScreen({Key? key}) : super(key: key);
  TextEditingController phonecontroller = TextEditingController();
  TextInputType phonetextInput = TextInputType.phone;
  TextEditingController passcontroller = TextEditingController();
  TextInputType passtextInput = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
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
                    "تم تسجيل حسابكم بنجاح",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "يمكنك تسجيل الدخول الان والطلب من اباري",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 20),
                  ButtonIconWidget(
                      title: Text("تسجيل دخول"),
                      width: 350,
                      bacColor: Color(0xff2B76B7),
                      forColor: Colors.white,
                      onPress: () {
                        Get.toNamed("/LoginScreen");
                      }),
                ],
              ),
            )));
  }
}
