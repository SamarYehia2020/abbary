import 'package:abbar_app/services/account/contact_us_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  TextEditingController namecontroller = TextEditingController();
  TextInputType nametextInput = TextInputType.text;

  TextEditingController mailcontroller = TextEditingController();
  TextInputType mailtextInput = TextInputType.emailAddress;

  TextEditingController phonecontroller = TextEditingController();
  TextInputType phonetextInput = TextInputType.phone;
  TextEditingController msgcontroller = TextEditingController();
  TextInputType msgtextInput = TextInputType.text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("اتصل بنا"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: ThemeApp.lightGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              LineAwesomeIcons.what_s_app,
                              color: Colors.white,
                              size: 50,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 230,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "للاستفسارات والشكاوي اضغط هنا لمراسلتنا عبر الواتس اب",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: Text(
                          "تابعنا علي مواقع التواصل",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: ThemeApp.textColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: ThemeApp.mainColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(LineAwesomeIcons.instagram)),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: ThemeApp.mainColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(LineAwesomeIcons.twitter)),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: ThemeApp.mainColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(LineAwesomeIcons.snapchat)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          "ارسل لنا استفسارك وسنرد عليك بعد سماع السفاره",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: ThemeApp.textColor),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              "الاسم بالكامل",
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                          TextFormWidget(
                            title: "",
                            controller: namecontroller,
                            textInput: nametextInput,
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              'رقم الجوال',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          TextFormWidget(
                            controller: phonecontroller,
                            textInput: TextInputType.phone,
                            title: '5xxxxxxxx',
                            suffix: Image.asset('assets/images/sau.png'),
                            //prefixText: '+966',
                            obsecure: false,
                            // validator: (value) {
                            //   if (value.toString().length < 9) {
                            //     return 'رقم الهاتف لايمكن ان يقل عن 9 ارقام !';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              "البريد الالكتروني",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          TextFormWidget(
                            title: "",
                            controller: mailcontroller,
                            textInput: mailtextInput,
                            obsecure: false,
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              "نص الرساله",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          TextFormField(
                              maxLines: 3,
                              enabled: true,
                              controller: msgcontroller,
                              keyboardType: msgtextInput,
                              decoration: InputDecoration(
                                fillColor: Color(0xffF1F1F1),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color(0xff9B9B9B),
                                    fontSize: 14,
                                    fontFamily: 'TajwalMedium',
                                    fontWeight: FontWeight.w500),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color(0xffF1F1F1), width: 0.0),
                                ),
                                enabled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )),
                          SizedBox(height: 15),
                          ButtonIconWidget(
                              title: Text("ارسال"),
                              width: double.infinity,
                              bacColor: ThemeApp.mainColor,
                              forColor: Colors.white,
                              onPress: () {
                                ContactUsServices contactUs =
                                    ContactUsServices();
                                var contact = contactUs.contactUs(
                                    email: mailcontroller.text,
                                    msg: msgcontroller.text,
                                    name: namecontroller.text,
                                    phone: phonecontroller.text);
                                print(contact);
                              }),
                          SizedBox(height: 20),
                        ],
                      ))
                    ],
                  ),
                ))));
  }
}
