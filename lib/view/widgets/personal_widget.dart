import 'package:flutter/material.dart';

class PersonalWidget extends StatelessWidget {
  Icon prefix;
  Widget? suffix;
  String title;
  Function() onPressed;
  PersonalWidget(
      {required this.prefix,
      this.suffix,
      required this.title,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        leading: prefix,
        trailing: suffix,
        style: ListTileStyle.list,
        shape: Border(bottom: BorderSide(color: Color(0xfff1f1f1), width: 2)),
      ),
    );
  }
}
