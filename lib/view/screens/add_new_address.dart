import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddNewAdressScreen extends StatefulWidget {
  AddNewAdressScreen({Key? key}) : super(key: key);

  @override
  State<AddNewAdressScreen> createState() => _AddNewAdressScreenState();
}

class _AddNewAdressScreenState extends State<AddNewAdressScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextInputType nametextInput = TextInputType.text;

  TextEditingController phonecontroller = TextEditingController();

  TextInputType phonetextInput = TextInputType.phone;

  TextEditingController elhaycontroller = TextEditingController();

  TextInputType elhaytextInput = TextInputType.text;

  TextEditingController notescontroller = TextEditingController();

  TextInputType notestextInput = TextInputType.text;

  TextEditingController addresscontroller = TextEditingController();

  TextInputType addresstextInput = TextInputType.text;

  TextEditingController housecontroller = TextEditingController();

  TextInputType housetextInput = TextInputType.text;

  TextEditingController doorcontroller = TextEditingController();

  TextInputType doortextInput = TextInputType.text;

  final auth_controller = Get.find<AuthController>();

  GetStorage box = GetStorage();

  final account_controller = Get.find<AccountController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    account_controller.gval;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("اضافة عنوان جديد"),
                color: Colors.white,
                iconBgColor: Color(0xffF1F1F1),
                iconColor: ThemeApp.textColor),
            body: Obx(
              () => Container(
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
                                "المدينه",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            FutureBuilder<dynamic>(
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
                                      value: auth_controller.dropVal,
                                      onChanged: (value) {
                                        setState(() {
                                          auth_controller.dropVal = value;
                                          box.write("cityData",
                                              auth_controller.dropVal);
                                          print(box.read("cityData"));
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
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "الحي",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            TextFormWidget(
                              title: "",
                              controller: elhaycontroller,
                              textInput: elhaytextInput,
                              obsecure: false,
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "العنوان",
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
                              controller: addresscontroller,
                              textInput: addresstextInput,
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "رقم البنايه",
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
                              controller: housecontroller,
                              textInput: housetextInput,
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "رقم الطابق",
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
                              controller: doorcontroller,
                              textInput: doortextInput,
                            ),
                            SizedBox(height: 15),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "تعيين كعنوان افتراضي",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: true,
                                    groupValue: account_controller.gval.value,
                                    onChanged: ((bool? value) {
                                      box.remove("isChosen");

                                      account_controller.gval.value = value!;
                                      box.write("isChosen",
                                          account_controller.gval.value);

                                      // print(box.read("isChosen"));
                                    })),
                                Text(
                                  "نعـم",
                                  style: Theme.of(context).textTheme.headline4,
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            ButtonIconWidget(
                                title: Text("اضافة عنوان"),
                                width: double.infinity,
                                bacColor: ThemeApp.mainColor,
                                forColor: Colors.white,
                                onPress: () async {
                                  await account_controller.createAddresss(
                                      apartementNumber:
                                          int.parse(housecontroller.text),
                                      buildingNumber:
                                          int.parse(doorcontroller.text),
                                      id: box.read("cityData"),
                                      isPrimary:
                                          box.read("isChosen") == true ? 1 : 0,
                                      locationText: "locationText",
                                      state: elhaycontroller.text,
                                      address: addresscontroller.text,
                                      lat: "55.64",
                                      lng: "57.57");
                                  // print(auth_controller.dropVal);
                                  Get.toNamed("/AddressesScreen");
                                }),
                            SizedBox(height: 20),
                          ],
                        ))
                      ],
                    ),
                  )),
            )));
  }
}
