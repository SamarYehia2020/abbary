import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/cart_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/database/cart_db.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/single_product_screen.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SellsWidget extends StatelessWidget {
  final main_controller = Get.find<MainController>();
  GetStorage box = GetStorage();
  String imgUrl;
  String? sell_product;
  String title;
  int? quantity;
  var priceAfter;
  var priceBefore;
  bool? isFav;
  int? id;
  final cart_controller = Get.find<CartController>();
  CartDb cartDb = CartDb();

  SellsWidget(
      {this.sell_product,
      required this.imgUrl,
      required this.title,
      this.priceAfter,
      this.priceBefore,
      this.isFav,
      this.quantity,
      this.id,
      Key? key})
      : super(key: key);

  final TextEditingController cartController = TextEditingController();
  final TextInputType cartInput = TextInputType.number;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Get.to(() => SingleProductScreen(), arguments: id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffF7f7f7),
                  ),
                  child: Image.network(imgUrl),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(247, 131, 131, 131)),
                    child: GetBuilder<AccountController>(
                      builder: (controller) => InkWell(
                        onTap: () async {
                          await controller.storeFavoritess(id!);

                          print(id.toString());
                        },
                        child: Icon(LineAwesomeIcons.heart_1,
                            color: Color(0xffffffff),
                            size: 15,
                            shadows: [
                              Shadow(
                                  blurRadius: 5,
                                  color: ThemeApp.lightTextColor,
                                  offset: Offset(2, 2))
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Text(
              id.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),

            SizedBox(
              height: 5,
            ),
            Text(title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: ThemeApp.lightGreen,
                    )),
            SizedBox(
              height: 5,
            ),
            Text(
              priceBefore.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            // Text(isFav.toString()),
            // SizedBox(
            //   height: 5,
            // ),
            Text(
              priceAfter.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: ThemeApp.lightTextColor)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffe3e3e3)),
                          child: InkWell(
                            onTap: () {},
                            child:
                                Icon(Icons.add, color: ThemeApp.lightTextColor),
                          ),
                        ),
                        Text(quantity.toString()),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffe3e3e3)),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.remove,
                                color: ThemeApp.lightTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeApp.mainColor),
                    child: InkWell(
                      onTap: () async {
                        // print("hiii");
                        int response = await cartDb.insertData(
                            "INSERT INTO 'items' (`item_id`,`item_name`,`item_category`,`item_price`,`item_quantity`,`item_img`) VALUES ('$id','$title','$sell_product','$priceAfter','$quantity','$imgUrl')");
                        List<dynamic> res =
                            await cartDb.readData("SELECT * FROM items");
                        await cart_controller.getItems();

                        print(res);
                      },
                      child: Icon(LineAwesomeIcons.shopping_cart,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
