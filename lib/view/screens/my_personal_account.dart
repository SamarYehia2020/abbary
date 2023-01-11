import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/controllers/index_controller.dart';
import 'package:abbar_app/services/others/social_media_service.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PersonalAccountScreen extends StatelessWidget {
  PersonalAccountScreen({Key? key}) : super(key: key);
  // final account_controller = Get.find<AccountController>();
  final index_controller = Get.find<IndexController>();
  final account_controller = Get.find<AccountController>();
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(0xfff1f1f1)),
        child: SingleChildScrollView(
            child: Column(children: [
          AccountBlock(),
          SettingBlock(),
          OthersBlock(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PersonalWidget(
                prefix: Icon(LineAwesomeIcons.alternate_sign_out),
                title: "تسجيل الخروج",
                onPressed: () {
                  auth_controller.logOut();
                }),
          ),
          GetBuilder<AccountController>(
            builder: (controller) => Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () async {
                          print(account_controller.whatsapp);
                          account_controller
                              .launchURL(account_controller.whatsapp);
                        },
                        icon: Icon(LineAwesomeIcons.what_s_app)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () async {
                          print(account_controller.instagram);
                          account_controller
                              .launchURL(account_controller.instagram);
                        },
                        icon: Icon(LineAwesomeIcons.instagram)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () async {
                          account_controller
                              .launchURL(account_controller.twitter);
                        },
                        icon: Icon(LineAwesomeIcons.twitter)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () async {
                          account_controller
                              .launchURL(account_controller.snapchat);
                          // SocialMediaService socialitems = SocialMediaService();
                          // var dsad = await socialitems.getSocial();
                          // print(dsad.facebook);
                        },
                        icon: Icon(LineAwesomeIcons.snapchat)),
                  ),
                ],
              ),
            ),
          ),
          FooterWidget()
        ])));
  }
}
