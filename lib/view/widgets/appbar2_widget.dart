import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Appbar2Widget extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  Color? color;
  Color? iconColor;
  Color? iconBgColor;
  Appbar2Widget(
      {this.iconBgColor, this.iconColor, this.color, this.title, Key? key})
      : super(key: key);
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      foregroundColor: ThemeApp.textColor,
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Color(0xff4A4A4A)),
      elevation: 0,
      leading: Container(
          margin: EdgeInsets.only(top: 10, right: 10),
          decoration: BoxDecoration(
              color: iconBgColor, borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: (() => Get.back()),
            icon: Icon(
              LineAwesomeIcons.arrow_right,
              size: 25,
              color: iconColor,
            ),
          )),
      backgroundColor: color,
      actions: [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
