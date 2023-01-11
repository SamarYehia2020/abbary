import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/best_sells_widget.dart';
import 'package:abbar_app/view/widgets/carousel_slider_widget.dart';
import 'package:abbar_app/view/widgets/category_carousel_widget.dart';
import 'package:abbar_app/view/widgets/sells_carousel_widget.dart';
import 'package:abbar_app/view/widgets/trade_mark_item_widget.dart';
import 'package:abbar_app/view/widgets/traditional_marks_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final main_controller = Get.find<MainController>();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   main_controller.onInit();
  // }

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            child: CarouselSliderWidget(),
            onTap: () {},
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  main_controller.carousel_images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => main_controller.control.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 3.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                                main_controller.carouselIndex.value == entry.key
                                    ? 0.9
                                    : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CategoriesSliderWidget(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "الأكثر مبيعا",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          SellsSliderWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "العلامات التجاريه",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {},
                  child: Text("عرض الكل"),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                      side: MaterialStateProperty.all(BorderSide(
                        color: ThemeApp.mainColor,
                      ))),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              print(main_controller.getBrands());
            },
            child: TraditionalMarksWidget(
              isshrinked: true,
            ),
          )
        ]),
      ),
    );
  }
}
