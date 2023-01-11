import 'dart:math';

import 'package:abbar_app/controllers/gift_controller.dart';
import 'package:abbar_app/database/cart_db.dart';
import 'package:abbar_app/models/home/single_product_model.dart';
import 'package:abbar_app/services/home/best_sells_service.dart';
import 'package:abbar_app/services/home/brands_service.dart';
import 'package:abbar_app/services/home/category_service.dart';
import 'package:abbar_app/services/home/products_service.dart';
import 'package:abbar_app/services/home/slider_service.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  CarouselController control = CarouselController();
  SliderService sliderist = SliderService();
  CategoryService catList = CategoryService();
  BestSellsService bestSellsList = BestSellsService();
  BrandsService brandsList = BrandsService();
  ProductsService products = ProductsService();
  GetStorage box = GetStorage();
  var productList = [];
  var brandItem;
  var sliderItem;
  var imgsUrl = [];
  var pImgUrl = [];
  var sellsProducts = [];
  var pSellsProducts = [];
  var pCategoriesList = [];
  var proId;
  bool? isfav;

  var pricesAfter = [];
  var idS = [];
  var pPricesAfter = [];
  var pricesBefore = [];
  var pPricesBefore = [];
  var quantities = [];
  var isFaves = [];
  var brands = [];
  var brandsName;
  var catItem;
  List sellsItem = [];
  List fetchproduct = [];
  List fetchBrands = [];
  SingleProductModel? fetchProductId;
  List catItems = [];
  List categoryImage = [];
  List categoryName = [];
  List slidersImage = [];
  String? item;
  int? iD;
  var proItems = 0;
  int? count;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await getProductById(iD);
    getBrands();
    getBestSells();

    // getProducts(id);
  }

  increment() {
    proItems++;
    update();
  }

  decrement() {
    proItems--;
    update();
  }

  Future<dynamic> getSliderItem() async {
    sliderItem = await sliderist.fetchSlider();

    slidersImage =
        List.generate(sliderItem.length, (index) => sliderItem[index].image);
    return slidersImage;
  }

  Future getCatItem() async {
    catItem = await catList.fetchCategories();

    return catItem;
  }

  Future getBrands() async {
    // box.write("brandId", id);
    brandItem = await brandsList.fetchBrands();
    // fetchBrands = brandItem.where((element) => element.id == id).toList();
    update();
  }

  Future getProducts(name) async {
    productList = await products.fetchProducts();
    fetchproduct = productList.where((element) {
      var item;
      for (item in element.categories) {
        return item = item["name"] == name;
      }
      return item;
    }).toList();
    update();
    print(fetchproduct.length);
    print(productList.length);
    print(name);
  }

  Future getProductsByBrandsName(name) async {
    productList = await products.fetchProducts();
    fetchBrands = productList.where((element) {
      var brandItem;
      for (brandItem in element.brands) {
        return brandItem = brandItem["name"] == name;
      }
      return brandItem;
    }).toList();
    update();
    print(fetchproduct.length);
    print(productList.length);
    print(name);
  }

  Future getProductById(id) async {
    iD = id;
    productList = await products.fetchProducts();
    fetchProductId =
        await productList.firstWhere((element) => element.id == id);
    update();
  }

  Future<dynamic> getBestSells() async {
    sellsItem = await bestSellsList.fetchBestSells();
    print(sellsItem.length);

    // imgsUrl =
    //     List.generate(sellsItem.length, (index) => sellsItem[index].mainImage);
    // sellsProducts =
    //     List.generate(sellsItem.length, (index) => sellsItem[index].title);
    // pricesBefore = List.generate(
    //     sellsItem.length, (index) => sellsItem[index].originalPrice);
    // pricesAfter =
    //     List.generate(sellsItem.length, (index) => sellsItem[index].finalPrice);
    // quantities =
    //     List.generate(sellsItem.length, (index) => sellsItem[index].quantity);
    // isFaves =
    //     List.generate(sellsItem.length, (index) => sellsItem[index].isFavorite);
    brands = List.generate(sellsItem.length, (index) => sellsItem[index].brand);
    // idS = List.generate(sellsItem.length, (index) => sellsItem[index].id);

    update();
  }

  Future<dynamic> getCategoryItemByImage() async {
    catItem = await catList.fetchCategories();

    categoryImage =
        List.generate(catItem.length, (index) => catItem[index].image);
    return categoryImage;
  }

  Future<dynamic> getCategoryItemByName() async {
    catItem = await catList.fetchCategories();

    categoryName =
        List.generate(catItem.length, (index) => catItem[index].name);
    return categoryName;
  }

  // final gift_controller = Get.find<GiftController>();
  List carousel_images = [
    "assets/images/slide.png",
    "assets/images/slide.png",
    "assets/images/slide.png",
    "assets/images/slide.png"
  ];

  RxInt carouselIndex = 0.obs;
  RxInt categoryIndex = 0.obs;
}
