import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PageViewScreen extends StatefulWidget {
  PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int currentIndex = 0;
  List<Map> splashPages = [
    {
      'imgUrl': "assets/images/logo.png",
      'title': "1توصيل المياه للمنازل",
      'desc': "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ماص"
    },
    {
      'imgUrl': "assets/images/logo.png",
      'title': "2توصيل المياه للمنازل",
      'desc': "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما ص"
    },
    {
      'imgUrl': "assets/images/logo.png",
      'title': "3توصيل المياه للمنازل",
      'desc': "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما ص"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: GestureDetector(
                    onTap: (() {
                      print("hello");
                    }),
                    child: currentIndex == 2
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              GetStorage skip = GetStorage();
                              skip.write("isClicked", true);
                              Get.toNamed("/LoginScreen");
                            },
                            child: Text(
                              'تخطي',
                              style: ThemeApp.light.textTheme.headline5,
                            ),
                          ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
                child: PageView.builder(
                    reverse: true,
                    itemCount: splashPages.length,
                    scrollDirection: Axis.horizontal,
                    padEnds: false,
                    allowImplicitScrolling: false,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Image.asset(splashPages[index]['imgUrl']),
                          SizedBox(
                            height: 70,
                          ),
                          Text(splashPages[index]['title'],
                              style: ThemeApp.light.textTheme.headline1),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            splashPages[index]['desc'],
                            style: ThemeApp.light.textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          DotsIndicator(
                            reversed: true,
                            dotsCount: splashPages.length,
                            position: currentIndex.toDouble(),
                            decorator: DotsDecorator(
                                activeShape: Border(
                                    left: BorderSide.none,
                                    bottom: BorderSide.none,
                                    right: BorderSide.none,
                                    top: BorderSide.none),
                                shape: Border(
                                    left: BorderSide.none,
                                    bottom: BorderSide.none,
                                    right: BorderSide.none,
                                    top: BorderSide.none),
                                color: Color(0xff9B9B9B),
                                activeSize: Size(15, 2),
                                size: Size(15, 2)),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          index == 2
                              ? ButtonIconWidget(
                                  title: Text("ابدأ الان"),
                                  width: 300,
                                  forColor: Colors.white,
                                  bacColor: Color(0xff2B76B7),
                                  onPress: () {
                                    Get.toNamed('/LoginScreen');
                                  })
                              : Container()
                        ],
                      );
                    }))));
  }
}
