import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/add_new_address.dart';
import 'package:abbar_app/view/screens/edit_address.dart';
import 'package:abbar_app/view/widgets/appbar2_widget.dart';
import 'package:abbar_app/view/widgets/appbar3_widget%20.dart';
import 'package:abbar_app/view/widgets/footer_widget.dart';
import 'package:abbar_app/view/widgets/personal_account_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_others_block_widget.dart';
import 'package:abbar_app/view/widgets/personal_widget.dart';
import 'package:abbar_app/view/widgets/setting_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AdressesScreen extends StatefulWidget {
  AdressesScreen({Key? key}) : super(key: key);

  @override
  State<AdressesScreen> createState() => _AdressesScreenState();
}

class _AdressesScreenState extends State<AdressesScreen> {
  final account_controller = Get.find<AccountController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    account_controller.getAdresses();
  }

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: Appbar3Widget(
              title: Text("عناويني"),
              icon1: IconButton(
                onPressed: () {
                  print(account_controller.addressesList.length);
                  Get.to(AddNewAdressScreen());
                },
                icon: Icon(
                  Icons.add,
                  size: 25,
                  color: ThemeApp.textColor,
                ),
              ),
            ),
            body: Obx(
              () => Container(
                  height: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Color(0xfff1f1f1),
                      child: Column(
                          children: List.generate(
                              account_controller.addressesList.length,
                              (index) => Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.all(20),
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                account_controller
                                                        .addressesList[index]
                                                    ["name"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(height: 1.5)),
                                            Text(
                                                account_controller
                                                        .addressesList[index]
                                                    ["phone"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(height: 1.5)),
                                            Text(
                                                account_controller
                                                        .addressesList[index]
                                                    ['city']["name"],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(height: 1.5)),
                                            Text(
                                                account_controller
                                                        .addressesList[index]
                                                    ['state'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(height: 1.5)),
                                            Text(
                                              account_controller
                                                      .addressesList[index]
                                                  ['location']['address'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                            account_controller.addressesList[
                                                        index]['is_primary'] ==
                                                    1
                                                ? Text(
                                                    "العنوان الافتراضي",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .copyWith(
                                                            color: ThemeApp
                                                                .mainColor,
                                                            height: 3),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        await account_controller
                                                            .showThisAddress(
                                                                account_controller
                                                                        .addressesList[
                                                                    index]['id']);
                                                        Get.to(
                                                            () =>
                                                                EditAdressScreen(),
                                                            arguments:
                                                                account_controller
                                                                        .addressesList[
                                                                    index]['id']);
                                                      },
                                                      icon: Icon(
                                                          LineAwesomeIcons
                                                              .edit)),
                                                  IconButton(
                                                      onPressed: () async {
                                                        await account_controller
                                                            .deleteThisAddress(
                                                                account_controller
                                                                        .addressesList[
                                                                    index]['id']);
                                                      },
                                                      icon: Icon(LineAwesomeIcons
                                                          .alternate_trash_1)),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))),
                    ),
                  )),
            )));
  }
}
