import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  Function() onPress;
  Widget title;
  double width;
  Color bacColor;
  Color forColor;
  ButtonIconWidget(
      {required this.title,
      required this.width,
      required this.bacColor,
      required this.forColor,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: title,
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "TajwalBold")),
          backgroundColor: MaterialStateProperty.all(bacColor),
          foregroundColor: MaterialStateProperty.all(forColor),
          minimumSize: MaterialStateProperty.all(Size(width, 48)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    );
  }
}
