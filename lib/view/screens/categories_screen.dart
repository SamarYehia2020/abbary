import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/widgets/product_category_widget.dart';
import 'package:abbar_app/view/widgets/product_item_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:abbar_app/view/widgets/traditional_marks_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController searchController = TextEditingController();

  final TextInputType searchTextInput = TextInputType.text;

  int currentIndex = 0;
  List<String> pages = [
    '/MainScreen',
    '/CategoriesScreen',
    '/MonthlyGiftScreen',
    '/CartScreen',
    '/PersonalAccountScreen'
  ];

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      ProductCategoryWidget(),
      TraditionalMarksWidget(
        isshrinked: false,
      )
    ]);
  }
}
