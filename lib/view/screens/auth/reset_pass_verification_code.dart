import 'package:abbar_app/services/auth_services/reenter_pass_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:abbar_app/view/widgets/verification_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ResetPassVerificationCodeScreen extends StatefulWidget {
  ResetPassVerificationCodeScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassVerificationCodeScreen> createState() =>
      _ResetPassVerificationCodeScreenState();
}

class _ResetPassVerificationCodeScreenState
    extends State<ResetPassVerificationCodeScreen> {
  bool _onEditing = true;
  late String code;
  final String phone = Get.arguments as String;

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "أدخل كود التفعيل",
                      style: ThemeApp.light.textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " قم بادخال كود التفعيل المرسل علي رقم جوالك لنتمكن من اعادة تعيين كلمة المرور",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    VerificationCode(
                      fullBorder: true,
                      autofocus: true,
                      textStyle:
                          TextStyle(fontSize: 20.0, color: Colors.red[900]),
                      keyboardType: TextInputType.number,
                      underlineColor: Colors
                          .amber, // If this is null it will use primaryColor: Colors.red from Theme
                      length: 6,
                      cursorColor: Colors.blue,
                      clearAll: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'clear all',
                          style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              color: Colors.blue[700]),
                        ),
                      ),
                      onCompleted: (String value) {
                        setState(() {
                          code = value;
                        });
                      },
                      onEditing: (bool value) {
                        setState(() {
                          _onEditing = value;
                        });
                        if (!_onEditing) FocusScope.of(context).unfocus();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonIconWidget(
                        title: Text("تأكيد"),
                        width: 350,
                        bacColor: Color(0xff2B76B7),
                        forColor: Colors.white,
                        onPress: () {
                          ConfirmReenterPassService confirm =
                              ConfirmReenterPassService();
                          var myCode = confirm.confirmRenterPass(
                            code: code,
                            deviceToken: "211212121",
                            phone: phone,
                          );
                          Get.toNamed("/ReEnterPassScreen",
                              arguments: [phone, code]);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          'اعادة ارسال الكود',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          Get.toNamed("/ForgetPassScreen");
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
