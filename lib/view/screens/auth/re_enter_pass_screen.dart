import 'package:abbar_app/services/auth_services/reenter_pass_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ReEnterPassScreen extends StatelessWidget {
  ReEnterPassScreen({Key? key}) : super(key: key);

  TextEditingController passcontroller = TextEditingController();
  TextInputType passtextInput = TextInputType.text;

  TextEditingController rePasscontroller = TextEditingController();
  TextInputType rePasstextInput = TextInputType.text;
  final List<String> data = Get.arguments;
  List<String> bar(List<String?> data) => List.from(data);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "اعادة تعيين كلمة المرور",
                    style: ThemeApp.light.textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormWidget(
                    title: "كلمة المرور الجديده",
                    controller: passcontroller,
                    textInput: passtextInput,
                    prefix: Icon(
                      LineAwesomeIcons.lock,
                      color: Color(0xff9B9B9B),
                    ),
                    suffix: Container(
                      child: Icon(LineAwesomeIcons.eye),
                    ),
                  ),
                  TextFormWidget(
                    title: "تأكيد كلمة المرور الجديده",
                    controller: rePasscontroller,
                    textInput: rePasstextInput,
                    obsecure: true,
                    prefix: Icon(
                      LineAwesomeIcons.lock,
                      color: Color(0xff9B9B9B),
                    ),
                    suffix: Container(
                      child: Icon(LineAwesomeIcons.eye),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonIconWidget(
                      title: Text("تعيين كلمة المرور"),
                      width: 350,
                      bacColor: Color(0xff2B76B7),
                      forColor: Colors.white,
                      onPress: () {
                        ReenterPassService info = ReenterPassService();
                        var details = info.rePass(
                            code: bar(data)[1],
                            phone: bar(data)[0],
                            //  Get.parameters['phone'],
                            deviceToken: "147852369",
                            password: passcontroller.text,
                            passwordConfirmation: rePasscontroller.text);
                        Get.toNamed("/SignUpDoneScreen");
                      }),
                ],
              ),
            )));
  }
}
