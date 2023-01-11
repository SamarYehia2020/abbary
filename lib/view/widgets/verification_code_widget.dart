import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeInputWidget extends StatelessWidget {
  String pinVal;
  VerificationCodeInputWidget({required this.pinVal, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 40,
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: ThemeApp.mainColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeApp.lightTextColor))),
        onSaved: (pinVal) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
