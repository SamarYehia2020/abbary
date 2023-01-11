import 'package:abbar_app/controllers/cart_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CartWidget extends StatelessWidget {
  final cart_controller = Get.find<CartController>();
  String imgUrl;
  String title;
  double price;
  int quantity;
  String category;
  int cartId;

  CartWidget(
      {required this.imgUrl,
      required this.title,
      required this.price,
      required this.quantity,
      required this.category,
      required this.cartId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: ThemeApp.lightTextColor))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                      width: 120,
                      height: 130,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("بيرين",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: ThemeApp.lightGreen,
                                    )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          price.toString(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: GetBuilder<CartController>(
                        builder: (controller) => ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.only(right: 2)),
                                foregroundColor: MaterialStateProperty.all(
                                    ThemeApp.textColor),
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffE3E3E3),
                                ),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () async {
                              await cart_controller.deleteItem(cartId);
                            },
                            child: Icon(
                              LineAwesomeIcons.trash,
                              size: 20,
                            )),
                      ),
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(children: [
                  Text(
                    "الكميه",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 130,
                    height: 45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 7),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: ThemeApp.lightTextColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: ThemeApp.lightTextColor)),
                        prefixIcon: IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              size: 30,
                              color: Color(0xffE3E3E3),
                            ),
                            onPressed: () {}),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: Color(0xffE3E3E3),
                            size: 30,
                          ),
                          onPressed: () {
                            print("hiiii");
                          },
                        ),
                        isCollapsed: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 3,
                          color: Colors.amber,
                        )),
                        enabled: true,
                        hintText: quantity.toString(),
                      ),
                    ),
                  ),
                ])),
                Text(
                  "22.50 ريال",
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            )
          ],
        ));
  }
}
