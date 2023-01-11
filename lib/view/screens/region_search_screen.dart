import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/city_search_screen.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RegionSearchScreen extends StatelessWidget {
  RegionSearchScreen({Key? key}) : super(key: key);
  TextEditingController searchcontroller = TextEditingController();
  TextInputType searchtextInput = TextInputType.text;
  List regions = [
    'عرض الكل',
    'الخبر',
    'العزيزيه',
    'السبعات',
    'القطيف',
    'جده',
    'المنطقه الشرقيه',
    'شمال جده',
    'جنوب جده',
    'العزيزيه'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeApp.mainColor,
        appBar: Appbar2Widget(
            title: Text(
              "تحديد المنطقه",
              style: TextStyle(color: Colors.white),
            ),
            color: ThemeApp.mainColor,
            iconColor: Colors.white,
            iconBgColor: Colors.white.withOpacity(.2)),
        body: Container(
          height: 1000,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70), topRight: Radius.circular(70)),
              color: Colors.white),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: TextFormWidget(
                  title: "البحث باسم المنطقه",
                  controller: searchcontroller,
                  textInput: searchtextInput,
                  prefix: Icon(Icons.search),
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                left: 0,
                bottom: 0,
                child: ListView.separated(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Get.to(() => CitySearchScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              regions[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: ThemeApp.lightTextColor),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        Divider(color: Color(0xfff1f1f1), thickness: 2),
                    itemCount: regions.length),
              ),
              Positioned(
                  bottom: 20,
                  top: 480,
                  right: 0,
                  left: 0,
                  child: ButtonIconWidget(
                      title: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(LineAwesomeIcons.map_marker),
                          SizedBox(
                            width: 20,
                          ),
                          Text("تحديد الموقع علي الخريطه")
                        ],
                      ),
                      width: double.infinity,
                      bacColor: ThemeApp.mainColor,
                      forColor: Colors.white,
                      onPress: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
