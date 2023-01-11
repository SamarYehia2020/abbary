import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class GiftWidget extends StatelessWidget {
  String title;
  String code;
  String imgUrl;
  GiftWidget(
      {required this.title, required this.code, required this.imgUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xfff1f1f1), width: 3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffE8F0F7)),
              child: Image.asset(
                imgUrl,
                width: 80,
              )),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      code,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: ThemeApp.lightGreen),
                      child: IconButton(
                          alignment: Alignment.bottomLeft,
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(LineAwesomeIcons.copy)),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
