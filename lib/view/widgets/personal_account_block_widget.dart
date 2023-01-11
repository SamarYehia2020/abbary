import 'package:abbar_app/view/screens/account_details.dart';
import 'package:abbar_app/view/screens/addresses.dart';
import 'package:abbar_app/view/screens/auth/re_enter_pass_screen.dart';
import 'package:abbar_app/view/screens/edit_password.dart';
import 'package:abbar_app/view/screens/favourites.dart';
import 'package:abbar_app/view/screens/monthly_gift.dart';
import 'package:abbar_app/view/screens/orders.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountBlock extends StatelessWidget {
  AccountBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "حسابي",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.user),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "تفاصيل الحساب",
              onPressed: () {
                Get.to(() => AccountDetailsScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.lock),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "تعديل كلمة المرور",
              onPressed: () {
                Get.to(() => EditPasswordScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.map_marker),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "عناويني",
              onPressed: () {
                Get.to(() => AdressesScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.heart),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "المفضله",
              onPressed: () {
                Get.to(() => FavouriteScreen());
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.archive),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "طلباتي",
              onPressed: () {
                Get.toNamed("OrdersScreen");
              }),
          PersonalWidget(
              prefix: Icon(LineAwesomeIcons.gift),
              suffix: Icon(LineAwesomeIcons.angle_left),
              title: "هدية الشهر",
              onPressed: () {
                Get.to(() => MonthlyGiftScreen());
              }),
        ],
      ),
    );
  }
}
