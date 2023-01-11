import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/add_new_address.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Appbar3Widget extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  IconButton? icon1;
  Widget? icon2;
  Appbar3Widget({this.icon1, this.icon2, this.title, Key? key})
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
              color: Color(0xffF1F1F1),
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: (() => Get.back()),
            icon: Icon(
              LineAwesomeIcons.arrow_right,
              size: 25,
              color: ThemeApp.textColor,
            ),
          )),
      backgroundColor: Colors.white,
      actions: [
        Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(50)),
            child: icon1),
        SizedBox(
          width: 10,
        ),
        if (icon2 != null) icon2!
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
