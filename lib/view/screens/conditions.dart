import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConditionsScreen extends StatelessWidget {
  ConditionsScreen({Key? key}) : super(key: key);
  final account_controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("شروط الاستخدام"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: FutureBuilder<dynamic>(
                    future: account_controller.getConditions(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var dataa = snapshot.data;
                        dynamic content = dataa!.content;

                        String html = dataa!.content;

                        RegExp exp = RegExp(r"<[^>]*>",
                            multiLine: true, caseSensitive: true);
//output without space:  HelloThis is fluttercampus.com,Bye!

                        String parsedstring = html.replaceAll(exp, '');
                        String contentData =
                            parsedstring.replaceAll("&nbsp;", '');

                        var imgUrl = dataa.headerImage;

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(
                                  imgUrl,
                                  errorBuilder:
                                      (context, exception, stackTrace) {
                                    return Image.asset(
                                        "assets/images/conditions.png");
                                  },
                                ),
                                //  Image.network(imgUrl),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 30),
                                  child:
                                      // Html(
                                      //   data: content,
                                      // )
                                      Text(
                                    contentData,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                            height: 1.5,
                                            fontWeight: FontWeight.normal),
                                  )
                                  //  Html(
                                  //   data: content,
                                  // ),
                                  ),
                            ],
                          ),
                        );
                      } else
                        return throw Exception("faiiil");
                    }))));
  }
}
