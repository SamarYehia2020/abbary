import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/models/account/profile_model.dart';
import 'package:abbar_app/services/auth_services/register_service.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar1_widget.dart';
import 'package:abbar_app/view/widgets/appbar3_widget%20.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController cityId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final auth_controller = Get.find<AuthController>();
  GetStorage box = GetStorage();

  // Future<List<dynamic>> getDataForId() async {
  //   idList = await auth_controller.cityInfoFunctionById();

  //   return idList;
  // }

  // items = await auth_controller.cityInfoFunction();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Appbar3Widget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إنشاء حساب جديد',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              children: [
                Text(
                  'لديك حساب؟',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/LoginScreen');
                  },
                  child: Text(
                    'سجل دخول الآن',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          decoration: TextDecoration.underline,
                          color: ThemeApp.mainColor,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'الاسم بالكامل',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TextFormWidget(
                    title: '',
                    controller: userName,
                    textInput: TextInputType.text,
                    obsecure: false,
                    // validator: (value) {
                    //   if (value.toString().length <= 2 ||
                    //       !RegExp(validationName).hasMatch(value)) {
                    //     return 'الاسم لايمكن ان يقل عن 3 أحرف !';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'رقم الجوال',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TextFormWidget(
                    controller: phoneNumber,
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
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'البريد الإلكتروني ',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: '(إختياري)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              )),
                        ],
                      ),
                    ),
                  ),
                  TextFormWidget(
                    title: '',
                    controller: emailAddress,
                    textInput: TextInputType.emailAddress,
                    obsecure: false,

                    // validator: (Value) {},
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'المدينة',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  GetBuilder<AuthController>(
                    builder: (controller) => FutureBuilder<dynamic>(
                      builder: (ctx, snapshot) {
                        if (snapshot.hasData) {
                          // var cityId = List.generate(snapshot.data.length,
                          //     (index) => snapshot.data[index].id);
                          // var cityName = List.generate(snapshot.data.length,
                          //     (index) => snapshot.data[index].name);

                          return DropdownButtonFormField(
                              style: TextStyle(
                                color: ThemeApp.lightTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Tajawal',
                              ),
                              elevation: 0,
                              hint: Text('يرجى اختيار المنطقة '),
                              icon: Icon(
                                LineAwesomeIcons.angle_down,
                                size: 14,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffF1F1F1),
                              ),
                              dropdownColor: Color(0xffF1F1F1),
                              value: auth_controller.dropVal,
                              onChanged: (value) {
                                setState(() {
                                  auth_controller.dropVal = value;
                                });
                              },
                              items: List.generate(
                                  snapshot.data.length,
                                  (index) => DropdownMenuItem(
                                        child: InkWell(
                                            onTap: () {
                                              print(snapshot.data[index].id);
                                            },
                                            child: Text(
                                                snapshot.data[index].name +
                                                    "            " +
                                                    (snapshot.data[index].id)
                                                        .toString())),
                                        value: snapshot.data[index].id,
                                      )));
                        } else {
                          return Container();
                        }
                      },

                      // Future that needs to be resolved
                      // inorder to display something on the Canvas
                      future: auth_controller.cityInfoFunction(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'كلمة المرور',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TextFormWidget(
                    title: '',
                    controller: password,
                    textInput: TextInputType.text,
                    suffix: IconButton(
                      onPressed: () {},
                      icon: Icon(LineAwesomeIcons.eye),
                    ),
                    obsecure: true,
                    // validator: (value) {
                    //   if (value.toString().length < 8) {
                    //     return 'كلمة المرور لايمكن أن تقل عن 8 ';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'تأكيد كلمة المرور',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TextFormWidget(
                    title: '',
                    controller: confirmPassword,
                    textInput: TextInputType.text,
                    suffix: IconButton(
                      onPressed: () {},
                      icon: Icon(LineAwesomeIcons.eye),
                    ),
                    obsecure: true,
                    // validator: (value) {
                    //   if (value.toString().length < 8) {
                    //     return 'كلمة المرور لايمكن أن تقل عن 8 ';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  SizedBox(height: 20),
                  GetBuilder<AuthController>(
                    builder: (controller) => ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          auth_controller.signUpDetails(
                              phoneNumber.text,
                              userName.text,
                              auth_controller.dropVal as int,
                              emailAddress.text,
                              password.text,
                              confirmPassword.text);
                          // RegisterServices registeration = RegisterServices();
                          // registeration.register(
                          //   name: userName.text,
                          //   phone: phoneNumber.text,
                          //   email: emailAddress.text,
                          //   cityId: box.read("x-city"),
                          //   password: password.text,
                          //   password_confirmation: confirmPassword.text,
                          // name: "saad mohamedddd",
                          // phone: "526352858",
                          // email: "samarrr@gmail.com",
                          // city_id: 10,
                          // password: "87654321",
                          // password_confirmation: "87654321"
                          // );
                          print(auth_controller.registInfo);
                          Get.toNamed('/SignUpVerificationCodeScreen');
                        }
                      },
                      child: Text('إنشاء حساب'),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            Center(
              child: Text(
                'تسجيلك لدى آباري يعني موافقتك على ',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DefaultAlertUtils();
                      });
                },
                child: Text(
                  'شروط الإستخدام',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Color(0xff2B76B7)),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class DefaultAlertUtils extends StatelessWidget {
  const DefaultAlertUtils({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      scrollable: true,
      title: IconButton(
        alignment: Alignment.topLeft,
        onPressed: () {},
        icon: Icon(
          LineAwesomeIcons.times,
          size: 22,
          color: Color(0xff9093A3),
        ),
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyText1,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'شروط الإستخدام',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          Text(
            ' إلى النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.',
            style: TextStyle(
              height: 1.4,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            ' إلى النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.',
            style: TextStyle(
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
