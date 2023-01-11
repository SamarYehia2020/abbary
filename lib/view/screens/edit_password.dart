import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/services/auth_services/new_pass_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditPasswordScreen extends StatelessWidget {
  EditPasswordScreen({Key? key}) : super(key: key);
  TextEditingController passcontroller = TextEditingController();
  TextInputType passtextInput = TextInputType.text;

  TextEditingController newPasscontroller = TextEditingController();
  TextInputType newPasstextInput = TextInputType.text;

  TextEditingController newPassConfirmationcontroller = TextEditingController();
  TextInputType newPassConfirmationtextInput = TextInputType.text;
  GetStorage box = GetStorage();
  final account_controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("تعديل كلمة المرور"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormWidget(
                            title: "كلمة المرور الحاليه",
                            controller: passcontroller,
                            textInput: passtextInput,
                            obsecure: true,
                            prefix: Icon(
                              LineAwesomeIcons.lock,
                              color: Color(0xff9B9B9B),
                            ),
                            suffix: Container(
                              child: Icon(LineAwesomeIcons.eye),
                            ),
                            max: 1,
                          ),
                          SizedBox(height: 15),
                          TextFormWidget(
                            title: "كلمة المرور الجديده",
                            controller: newPasscontroller,
                            textInput: newPasstextInput,
                            obsecure: true,
                            prefix: Icon(
                              LineAwesomeIcons.lock,
                              color: Color(0xff9B9B9B),
                            ),
                            suffix: Container(
                              child: Icon(LineAwesomeIcons.eye),
                            ),
                            max: 1,
                          ),
                          SizedBox(height: 15),
                          TextFormWidget(
                            title: "تأكيد كلمة المرور الجديده",
                            controller: newPassConfirmationcontroller,
                            textInput: newPassConfirmationtextInput,
                            obsecure: true,
                            prefix: Icon(
                              LineAwesomeIcons.lock,
                              color: Color(0xff9B9B9B),
                            ),
                            suffix: Container(
                              child: Icon(LineAwesomeIcons.eye),
                            ),
                            max: 1,
                          ),
                          SizedBox(height: 30),
                          Text(box.read("deviceToken")),
                          Text(box.read("cityId").toString()),
                          ButtonIconWidget(
                              title: Text("حفظ التعديلات"),
                              width: double.infinity,
                              bacColor: ThemeApp.mainColor,
                              forColor: Colors.white,
                              onPress: () async {
                                NewPassService newPassService =
                                    NewPassService();
                                var data = await newPassService.newPass(
                                    oldPass: passcontroller.text,
                                    newPassword: newPasscontroller.text,
                                    newPasswordConfirmation:
                                        newPassConfirmationcontroller.text,
                                    deviceToken: box.read("deviceToken"));
                              }),
                          SizedBox(height: 20),
                        ],
                      ))
                    ],
                  ),
                ))));
  }
}
