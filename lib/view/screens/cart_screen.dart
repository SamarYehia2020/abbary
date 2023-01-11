import 'package:abbar_app/controllers/cart_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/database/cart_db.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/button_icon_widget.dart';
import 'package:abbar_app/view/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cart_controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<CartController>(
          builder: (controller) => Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CartWidget(
                      imgUrl: cart_controller.items[index]['item_img'],
                      title: cart_controller.items[index]['item_name'],
                      price: cart_controller.items[index]['item_price'],
                      quantity: cart_controller.items[index]['item_quantity'],
                      category: cart_controller.items[index]['item_category'],
                      cartId: cart_controller.items[index]['cart_id'],
                    ),
                separatorBuilder: (context, index) => Divider(
                      color: ThemeApp.lightTextColor,
                      thickness: 1,
                    ),
                itemCount: controller.count),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 238, 236, 236), width: 3)),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("اجمالي الطلب",
                      style: Theme.of(context).textTheme.headline3),
                  Text(
                    "45.60 ريال",
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
              GetBuilder<CartController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonIconWidget(
                        title: Text("تابع عملية الدفع"),
                        width: 150,
                        bacColor: ThemeApp.mainColor,
                        forColor: Colors.white,
                        onPress: () async {
                          print(cart_controller.items);
                          print(cart_controller.count);
                        }),
                    ButtonIconWidget(
                        title: Text("اضافة المزيد"),
                        width: 150,
                        bacColor: Color(0xffE8F0F7),
                        forColor: ThemeApp.mainColor,
                        onPress: () {})
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
