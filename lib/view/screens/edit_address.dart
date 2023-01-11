import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/addresses.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditAdressScreen extends StatefulWidget {
  EditAdressScreen({Key? key}) : super(key: key);

  @override
  State<EditAdressScreen> createState() => _EditAdressScreenState();
}

class _EditAdressScreenState extends State<EditAdressScreen> {
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

  final address_id = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar2Widget(
                title: Text("التعديل علي العنوان"),
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
                                "الاسم بالكامل",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            TextFormWidget(
                              title: account_controller
                                  .showAddressJsonData['name'],
                              controller: namecontroller,
                              textInput: nametextInput,
                              obsecure: false,
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
                              textInput: phonetextInput,
                              title: account_controller
                                  .showAddressJsonData['phone'],
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
                                "المدينه",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
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
                                        hint: Text(account_controller
                                                .showAddressJsonData['city']
                                            ['name']),
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
                                        value: account_controller
                                            .showAddressJsonData['city']['id'],
                                        onChanged: (value) {
                                          setState(() {
                                            box.remove("cityData");
                                            box.write("cityData", value);
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
                                                              .data[index]
                                                              .name +
                                                          "            " +
                                                          (snapshot.data[index]
                                                                  .id)
                                                              .toString())),
                                                  value:
                                                      snapshot.data[index].id,
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
                                "الحي",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            TextFormWidget(
                              title: account_controller
                                  .showAddressJsonData['state'],
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
                              title: account_controller
                                  .showAddressJsonData['location']['address'],
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
                              title: account_controller
                                  .showAddressJsonData['building_number'],
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
                              title: account_controller
                                  .showAddressJsonData['apartment_number'],
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
                                    value:
                                        account_controller.showAddressJsonData[
                                                    'is_primary'] ==
                                                1
                                            ? false
                                            : true,
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
                                title: Text("حفظ التعديلات"),
                                width: double.infinity,
                                bacColor: ThemeApp.mainColor,
                                forColor: Colors.white,
                                onPress: () async {
                                  await account_controller.editThisAddress(
                                      id: address_id,
                                      cityId: box.read("cityData"),
                                      state: elhaycontroller.text,
                                      apartementNumber:
                                          int.parse(doorcontroller.text),
                                      buildingNumber:
                                          int.parse(housecontroller.text),
                                      locationText: "locationText",
                                      address: addresscontroller.text,
                                      isPrimary:
                                          box.read("isChosen") == true ? 1 : 0,
                                      name: namecontroller.text,
                                      phone: phonecontroller.text);
                                  // await account_controller.createAddresss(
                                  //     apartementNumber:
                                  //         int.parse(housecontroller.text),
                                  //     buildingNumber:
                                  //         int.parse(doorcontroller.text),
                                  //     id: box.read("cityData"),
                                  //     isPrimary:
                                  //         box.read("isChosen") == true ? 1 : 0,
                                  //     locationText: "locationText",
                                  //     state: elhaycontroller.text,
                                  //     address: addresscontroller.text,
                                  //     lat: "55.64",
                                  //     lng: "57.57");
                                  // // print(auth_controller.dropVal);
                                  // Get.toNamed("/AddressesScreen");
                                  Get.to(() => AdressesScreen());
                                  print(address_id);
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
