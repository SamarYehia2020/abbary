import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountDetailsScreen extends StatefulWidget {
  AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextInputType nametextInput = TextInputType.text;

  TextEditingController mailcontroller = TextEditingController();

  TextInputType mailtextInput = TextInputType.emailAddress;

  TextEditingController phonecontroller = TextEditingController();

  TextInputType phonetextInput = TextInputType.phone;

  TextEditingController msgcontroller = TextEditingController();

  TextInputType msgtextInput = TextInputType.text;

  TextEditingController citycontroller = TextEditingController();

  TextInputType citytextInput = TextInputType.text;

  final account_controller = Get.find<AccountController>();
  final auth_controller = Get.find<AuthController>();

  GetStorage box = GetStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // namecontroller.text = box.read("newName");
    // phonecontroller.text = box.read("newPhone");
    // mailcontroller.text = box.read("newEmail");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("تفاصيل الحساب"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              " الاسم بالكامل",
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
                            labelText: Text(box.read("name")),
                            title: '',
                            controller: namecontroller,
                            textInput: nametextInput,
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
                            labelText: Text(box.read("email")),
                            title: '',
                            controller: mailcontroller,
                            textInput: mailtextInput,
                            obsecure: false,
                          ),
                          SizedBox(height: 15),
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
                                      hint: Text(box.read("cityName")),
                                      icon: Icon(
                                        LineAwesomeIcons.angle_down,
                                        size: 14,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Colors.red,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                            width: 0,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xffF1F1F1),
                                      ),
                                      dropdownColor: Color(0xffF1F1F1),
                                      value: box.read('cityId'),
                                      onChanged: (value) {
                                        setState(() {
                                          box.remove("cityId");
                                          box.write("cityId", value);
                                        });
                                      },
                                      items: List.generate(
                                          snapshot.data.length,
                                          (index) => DropdownMenuItem(
                                                child: InkWell(
                                                    onTap: () {
                                                      print(snapshot
                                                          .data[index].id);
                                                    },
                                                    child: Text(snapshot
                                                            .data[index].name +
                                                        "            " +
                                                        (snapshot
                                                                .data[index].id)
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
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              "رقم الجوال",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          TextFormWidget(
                            controller: phonecontroller,
                            textInput: TextInputType.phone,
                            labelText: Text(box.read("phone")),
                            title: '',
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
                          SizedBox(height: 30),
                          GetBuilder<AccountController>(
                            builder: (controller) => ButtonIconWidget(
                                title: Text("حفظ التعديلات"),
                                width: double.infinity,
                                bacColor: ThemeApp.mainColor,
                                forColor: Colors.white,
                                onPress: () async {
                                  // print(account_controller.favList![0].id);
                                  // print(account_controller.favList.length);

                                  await account_controller.editProfileFun(
                                      namecontroller.text,
                                      phonecontroller.text,
                                      mailcontroller.text,
                                      box.read("cityId"),
                                      box.read("deviceToken"));
                                }),
                          ),
                          SizedBox(height: 20),
                        ],
                        // FutureBuilder<dynamic>(
                        //     future: account_controller.getProfile(),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.hasData) {
                        //         var dataa = snapshot.data;
                        //         String name = dataa.name;
                        //         String phone = dataa.phone;
                        //         var email = dataa.email;
                        //         // var cityName = dataa.city.cityName;
                        //         return

                        //         );
                        //       } else
                        //         return throw Exception("faiiiil");
                        //     })
                      ))
                    ],
                  ),
                ))));
  }
}
