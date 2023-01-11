import 'package:abbar_app/controllers/index_controller.dart';
import 'package:abbar_app/view/screens/notifications.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SettingBlock extends StatelessWidget {
  SettingBlock({Key? key}) : super(key: key);
  final setting_controller = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "الاعدادات",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          GetBuilder<IndexController>(
            builder: (controller) => PersonalWidget(
                prefix: Icon(Icons.notifications_none),
                suffix: Switch(
                    value: setting_controller.ischanged,
                    onChanged: (changed) {
                      setting_controller.replacement();
                    }),
                title: "الاشعارات",
                onPressed: () {
                  Get.to(() => NotificationScreen());
                }),
          ),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.clock),
              suffix: Text("1.1.0"),
              title: "اصدار التطبيق",
              onPressed: () {}),
        ],
      ),
    );
  }
}
