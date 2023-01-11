import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SortWidget extends StatelessWidget {
  SortWidget({Key? key}) : super(key: key);
  List sortList = [
    'حسب الترتيب الابجدي ',
    'حسب الترتيب الابجدي ',
    'حسب الترتيب الابجدي ',
    'حسب الترتيب الابجدي ',
  ];
  bool? checked;

  @override
  IconButton build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(Container(
          height: 400,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70), topRight: Radius.circular(70)),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "البحث حسب",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(10),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {},
                            title: Text(sortList[index]),
                            trailing: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ThemeApp.mainColor,
                                    shape: BoxShape.circle),
                                width: 25,
                                height: 25,
                                child: Icon(
                                  LineAwesomeIcons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          Divider(color: Color(0xfff1f1f1), thickness: 2),
                      itemCount: sortList.length),
                ),
                ButtonIconWidget(
                    title: Text("بحـــــث"),
                    width: double.infinity,
                    bacColor: ThemeApp.mainColor,
                    forColor: Colors.white,
                    onPress: () {})
              ],
            ),
          ),
        ));
      },
      icon: Icon(
        LineAwesomeIcons.sort,
        size: 25,
        color: ThemeApp.textColor,
      ),
    );
  }
}
