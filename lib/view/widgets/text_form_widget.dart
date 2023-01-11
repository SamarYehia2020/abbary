import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  var title;
  Icon? prefix;
  Widget? suffix;
  TextEditingController controller;

  TextInputType textInput;
  bool obsecure;
  int? max;
  int? min;
  Text? labelText;

  TextFormWidget(
      {this.obsecure = false,
      this.max,
      this.min,
      required this.title,
      this.labelText,
      this.prefix,
      this.suffix,
      required this.controller,
      required this.textInput,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 48,
      child: TextFormField(
          enabled: true,
          controller: controller,
          keyboardType: textInput,
          obscureText: obsecure,
          decoration: InputDecoration(
            label: labelText,
            fillColor: Color(0xffF1F1F1),
            prefixIcon: prefix,
            suffixIcon: suffix,
            filled: true,
            hintText: title,
            hintStyle: TextStyle(
                color: Color(0xff9B9B9B),
                fontSize: 12,
                fontFamily: 'TajwalMedium',
                fontWeight: FontWeight.w500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xffF1F1F1), width: 0.0),
            ),
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          )),
    );
  }
}
