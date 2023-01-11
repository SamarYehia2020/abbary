import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/best_sells_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SellsSliderWidget extends StatefulWidget {
  SellsSliderWidget({Key? key}) : super(key: key);

  @override
  State<SellsSliderWidget> createState() => _SellsSliderWidgetState();
}

class _SellsSliderWidgetState extends State<SellsSliderWidget> {
  final main_controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => CarouselSlider.builder(
          itemCount: controller.sellsItem.length,
          carouselController: controller.control,
          itemBuilder: (context, index, realIndex) => Container(
              alignment: Alignment.topRight,
              width: 250,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: SellsWidget(
                imgUrl: controller.sellsItem[index].mainImage,
                sell_product: controller.sellsItem[index].title,
                title: controller.brands[index]["name"],
                priceAfter: controller.sellsItem[index].finalPrice,
                priceBefore: controller.sellsItem[index].originalPrice,
                quantity: controller.sellsItem[index].quantity,
                // isFav: controller.isFaves[index],
                id: controller.sellsItem[index].id,
              )),
          options: CarouselOptions(
            viewportFraction: .47,
            autoPlay: true,
            height: 320,
            onPageChanged: (index, reason) {
              main_controller.categoryIndex.value = index;
            },
          )),
    );

    //  FutureBuilder<dynamic>(
    //     future: main_controller.getBestSells(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         final List<dynamic> dataa = snapshot.data as List<dynamic>;

    //         List<String> dataImage =
    //             List.generate(dataa.length, (index) => dataa[index].mainImage);
    //         List<String> dataTitle =
    //             List.generate(dataa.length, (index) => dataa[index].title);
    //         List<dynamic> dataPriceBefore = List.generate(
    //             dataa.length, (index) => dataa[index].originalPrice);
    //         List<dynamic> dataPriceAfter =
    //             List.generate(dataa.length, (index) => dataa[index].finalPrice);
    //         List<dynamic> dataQuantity =
    //             List.generate(dataa.length, (index) => dataa[index].quantity);
    //         List<dynamic> dataFavourite =
    //             List.generate(dataa.length, (index) => dataa[index].isFavorite);
    //         // List<String> dataBrand = List.generate(
    //         //     dataa.length, (index) => dataa[index].brands[index].name);

    //         return
    //         ;
    //       } else {
    //         return throw Exception("faiiiiiiil");
    //       }
    //     });

    // return CarouselSlider.builder(
    //     carouselController: main_controller.controller,
    //     itemCount: main_controller.categories.length,
    //     itemBuilder: (context, index, realIndex) => Container(
    //         alignment: Alignment.topRight,
    //         width: 250,
    //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    //         margin: EdgeInsets.symmetric(horizontal: 5),
    //         child: SellsWidget(
    //           imgUrl: main_controller.categories[index]['imgUrl'],
    //           sell_product: main_controller.categories[index]['product'],
    //           title: main_controller.categories[index]['product'],
    //           priceAfter: main_controller.categories[index]['product'],
    //           priceBefore: main_controller.categories[index]['product'],
    //         )),
    //     options: CarouselOptions(
    //       viewportFraction: .47,
    //       autoPlay: true,
    //       height: 320,
    //       onPageChanged: (index, reason) {
    //         main_controller.categoryIndex.value = index;
    //       },
    //     ));
  }
}
