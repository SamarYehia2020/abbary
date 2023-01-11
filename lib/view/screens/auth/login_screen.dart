import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/models/auth/city_model.dart';
import 'package:abbar_app/services/auth_services/login_service.dart';
import 'package:abbar_app/services/city_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phonecontroller = TextEditingController();

  TextInputType phonetextInput = TextInputType.phone;

  TextEditingController passcontroller = TextEditingController();

  TextInputType passtextInput = TextInputType.text;

  final auth_controller = Get.find<AuthController>();

  String mToken = '';

  // @override
  // void initState() {
  //   super.initState();
  //   requestPermission();
  //   getToken();
  //   initInfo();
  // }

  // void getToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(() {
  //       mToken = token!;
  //       print("My Token is $mToken");
  //     });
  //     saveToken(token!);
  //   });
  // }

  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance
  //       .collection("User Tokens")
  //       .doc("user2")
  //       .set({'token': token});
  // }

  // void requestPermission() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   NotificationSettings settings = await messaging.requestPermission(
  //       alert: true,
  //       announcement: true,
  //       badge: true,
  //       carPlay: false,
  //       criticalAlert: false,
  //       provisional: false,
  //       sound: true);
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print("user guaranteed permission");
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print("user guarenteed provisional permission");
  //   } else {
  //     print("not permitted");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: GestureDetector(
                  onTap: (() {
                    print("hello");
                  }),
                  child: GestureDetector(
                    onTap: () => Get.toNamed("/IndexScreen"),
                    child: Text(
                      'الدخول كزائر',
                      textDirection: TextDirection.ltr,
                      style: ThemeApp.light.textTheme.headline5,
                    ),
                  ),
                ),
              ),
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.white,
              actions: [],
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تسجيل الدخول",
                      style: ThemeApp.light.textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "ليس لديك حساب؟",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/SignUpScreen");
                          },
                          child: Text('انشئ حسابك الان',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Color(0xff2B76B7),
                                      decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormWidget(
                      title: "رقم الجوال",
                      controller: phonecontroller,
                      textInput: phonetextInput,
                      prefix: Icon(
                        LineAwesomeIcons.phone,
                        color: Color(0xff9B9B9B),
                      ),
                    ),
                    TextFormWidget(
                      title: "كلمة المرور",
                      controller: passcontroller,
                      textInput: passtextInput,
                      obsecure: true,
                      prefix: Icon(
                        LineAwesomeIcons.lock,
                        color: Color(0xff9B9B9B),
                      ),
                      suffix: Container(
                        child: Icon(LineAwesomeIcons.eye),
                      ),
                      max: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonIconWidget(
                        title: Text("دخــــول"),
                        width: 350,
                        bacColor: Color(0xff2B76B7),
                        forColor: Colors.white,
                        onPress: () async {
                          await auth_controller.loginDetails(
                              phonecontroller.text, passcontroller.text);
                          // await main_controller.getBestSells();
                          // LoginServices loginInfo = LoginServices();
                          // var loginDetails = loginInfo.login(
                          //     password: passcontroller.text,
                          //     phone: phonecontroller.text);
                          // print(loginDetails);
                          // var m = await controller.cityInfoFunction();

                          // print(m);

                          // CityService city = CityService();
                          // var cityInfo = await city.cityInfo();

                          // print(cityInfo[0].name);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        child: Text(
                          'هل نسيت كلمة المرور؟',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          Get.toNamed("/ForgetPassScreen");
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
