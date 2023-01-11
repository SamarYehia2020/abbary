import 'package:abbar_app/services/auth_services/forgot_pass_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);
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
              iconBgColor: Color(0xffF1F1F1),
              iconColor: ThemeApp.textColor,
              color: Colors.white,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "هل نسيت كلمة المرور؟",
                    style: ThemeApp.light.textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "فضلا قم بادخال رقم جوالك وسيتم ارسال كود التفعيل لاعادة تعيين كلمة المرور",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormWidget(
                    title: "رقم الجوال",
                    controller: phonecontroller,
                    textInput: phonetextInput,
                    prefix: Icon(
                      LineAwesomeIcons.phone,
                      color: Color(0xff9B9B9B),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonIconWidget(
                      title: Text("ارســــال"),
                      width: 350,
                      bacColor: Color(0xff2B76B7),
                      forColor: Colors.white,
                      onPress: () {
                        ForgotPassService info = ForgotPassService();
                        var details = info.forgot(phone: phonecontroller.text);

                        Get.toNamed("/ResetPassVerificationCodeScreen",
                            arguments: phonecontroller.text
                            // parameters: {'phone': phonecontroller.text}
                            );
                      }),
                ],
              ),
            )));
  }
}
