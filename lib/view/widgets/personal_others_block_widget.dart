import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/view/screens/about.dart';
import 'package:abbar_app/view/screens/conditions.dart';
import 'package:abbar_app/view/screens/contact_us.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class OthersBlock extends StatelessWidget {
  OthersBlock({Key? key}) : super(key: key);
  final account_controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.book_open),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "عن اباري",
              onPressed: () {
                print(account_controller.getAbout());
                Get.to(() => AboutScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.alternate_file_1),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "شروط الاستخدام",
              onPressed: () {
                Get.to(() => ConditionsScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.envelope),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "اتصل بنا",
              onPressed: () {
                Get.to(() => ContactScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.star),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "تقييم التطبيق",
              onPressed: () {}),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.share),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "مشاركة التطبيق",
              onPressed: () {}),
        ],
      ),
    );
  }
}
