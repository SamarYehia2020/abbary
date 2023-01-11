import 'package:abbar_app/controllers/main_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({Key? key}) : super(key: key);
  final main_controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => FutureBuilder<dynamic>(
          future: main_controller.getSliderItem(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final List<dynamic> data = snapshot.data;
                return CarouselSlider(
                    carouselController: main_controller.control,
                    items: data
                        .map((imgurl) => Container(
                              child: Image.network(
                                imgurl,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      aspectRatio: 2,
                      onPageChanged: (index, reason) {
                        main_controller.carouselIndex.value = index;
                      },
                    ));
              } else if (snapshot.hasError) {
                return throw Exception("noooooo");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return throw Exception("faiiiil");
            }
            return throw Exception("faiiiil");
          }),
    );
  }
}
