import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Image.asset("assets/images/foot1.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Image.asset("assets/images/foot2.jpg"),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "اباري 2022 - جميع الحقوق محفوظه \u00a9",
                style: Theme.of(context).textTheme.headline5,
              ))
        ],
      ),
    );
  }
}
