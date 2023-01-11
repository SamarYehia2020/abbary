import 'package:abbar_app/controllers/account_controller.dart';
import 'package:abbar_app/controllers/auth_controller.dart';
import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:abbar_app/controllers/main_controller.dart';
import 'package:abbar_app/controllers/index_controller.dart';
import 'package:abbar_app/utils/theme.dart';
import 'package:abbar_app/view/screens/cart_screen.dart';
import 'package:abbar_app/view/screens/categories_screen.dart';
import 'package:abbar_app/view/screens/main_screen.dart';
import 'package:abbar_app/view/screens/monthly_gift.dart';
import 'package:abbar_app/view/screens/my_personal_account.dart';
import 'package:abbar_app/view/widgets/appbar1_widget.dart';
import 'package:abbar_app/view/widgets/product_category_widget.dart';
import 'package:abbar_app/view/widgets/product_item_widget.dart';
import 'package:abbar_app/view/widgets/text_form_widget.dart';
import 'package:abbar_app/view/widgets/traditional_marks_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final TextEditingController searchController = TextEditingController();

  final TextInputType searchTextInput = TextInputType.text;
  final index_controller = Get.find<IndexController>();
  final carousel_controller = Get.find<MainController>();
  final gift_controller = Get.find<GiftController>();
  final account_controller = Get.find<AccountController>();
  final auth_controller = Get.find<AuthController>();

  int currentIndex = 0;
  List<Widget> pages = [
    MainScreen(),
    CategoriesScreen(),
    MonthlyGiftScreen(),
    CartScreen(),
    PersonalAccountScreen()
  ];
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Appbar1Widget()),
          body: GetBuilder<IndexController>(
            builder: (controller) => IndexedStack(
              index: index_controller.currentIndex,
              children: List.generate(pages.length, (index) {
                return pages[index];
              }),
            ),
          ),
          // body: TabBarView(
          //     children: [ProductCategoryWidget(), TraditionalMarksWidget()]),
          bottomNavigationBar: GetBuilder<IndexController>(
            builder: (controller) => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  setState(() {
                    if (box.read("auth") == true) {
                      index_controller.currentIndex = value;
                    } else if (box.read("auth") == false) {
                      if (value != 2 && value != 4) {
                        index_controller.currentIndex = value;
                      }
                    }

                    //  else if (box.read("auth") == false &&
                    //     value != 4 &&
                    //     value != 2) {
                    //   index_controller.currentIndex = value;
                    // }
                  });
                },
                showUnselectedLabels: true,
                showSelectedLabels: true,
                currentIndex: index_controller.currentIndex,
                mouseCursor: MouseCursor.defer,
                selectedItemColor: ThemeApp.mainColor,
                selectedLabelStyle: ThemeApp.light.textTheme.headline6,
                unselectedItemColor: ThemeApp.lightTextColor,
                backgroundColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'الرئيسيه',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.th_large),
                    label: 'الاقسام',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.gift),
                    label: 'هدية الشهر',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.shopping_cart),
                    label: 'السله',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.user),
                    label: 'حسابي',
                  ),
                ]),
          )),
    ));
  }

  void _onItemTapped(int index) {}

  TabBar get tabBar => TabBar(tabs: [
        Tab(
            child: Text(
          "أقسام المنتجات",
          style: ThemeApp.light.textTheme.headline3,
        )),
        Tab(
            child: Text(
          "العلامات التجاريه",
          style: ThemeApp.light.textTheme.headline3,
        ))
      ]);
}
