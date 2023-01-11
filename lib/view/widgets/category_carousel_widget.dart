import 'package:abbar_app/controllers/main_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoriesSliderWidget extends StatelessWidget {
  CategoriesSliderWidget({Key? key}) : super(key: key);
  final main_controller = Get.find<MainController>();
  String? itemImage;
  String? itemName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: main_controller.getCatItem(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<dynamic> data = snapshot.data;
              List<String> dataImage =
                  List.generate(data.length, (index) => data[index].image);
              List<String> dataName =
                  List.generate(data.length, (index) => data[index].name);

              return CarouselSlider.builder(
                  itemCount: data.length,
                  carouselController: main_controller.control,
                  itemBuilder: (context, index, realIndex) => Container(
                      alignment: Alignment.center,
                      width: 150,
                      color: Color(0xffE8F0F7),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                  onTap: () {
                                    print(main_controller
                                        .getCategoryItemByImage());
                                  },
                                  child: Image.network(dataImage[index]),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              dataName[index],
                              style: Theme.of(context).textTheme.headline5,
                            ))
                          ])),
                  options: CarouselOptions(
                    viewportFraction: .25,
                    autoPlay: true,
                    height: 120,
                    onPageChanged: (index, reason) {
                      main_controller.categoryIndex.value = index;
                    },
                  ));
            }
          } else if (snapshot.hasError) {
            return throw Exception("noooooo");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return throw Exception("faiiiil");
          }
          return throw Exception("faiiiil");
        });
  }
}
