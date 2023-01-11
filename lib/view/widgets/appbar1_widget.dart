import 'package:abbar_app/controllers/index_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/region_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Appbar1Widget extends StatelessWidget {
  Appbar1Widget({Key? key}) : super(key: key);
  final index_controller = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(
        builder: (controller) => AppBar(
              bottom: index_controller.currentIndex == 1
                  ? PreferredSize(
                      child: Material(color: Color(0xfff1f1f1), child: tabBar),
                      preferredSize: tabBar.preferredSize)
                  : null,
              elevation: 0,
              title: Container(
                height: 35,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(right: 0),
                alignment: Alignment.topCenter,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "بـحـث",
                      contentPadding: EdgeInsets.only(top: 10),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: ThemeApp.lightTextColor)),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 20,
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: ThemeApp.lightTextColor))),
                ),
              ),
              leading: Container(
                padding: const EdgeInsets.only(top: 10, right: 20, bottom: 10),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.white,
              actions: [
                Container(
                  width: 95,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 60,
                        padding: EdgeInsets.only(right: 0, top: 5),
                        child: IconBadge(
                          itemCount: 3,
                          itemColor: Colors.white,
                          badgeColor: ThemeApp.lightGreen,
                          right: 0,
                          icon: Icon(
                            LineAwesomeIcons.bell,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ThemeApp.mainColor),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => RegionSearchScreen());
                            },
                            child: Icon(LineAwesomeIcons.map_marker,
                                color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ));
  }

  TabBar get tabBar => TabBar(tabs: [
        Tab(
            child: Text(
          "أقسام المنتجات",
          style: ThemeApp.light.textTheme.headline3,
        )),
        Tab(
            child: Text(
          "العلامات التجاريه",
          style: ThemeApp.light.textTheme.headline3,
        ))
      ]);
}
