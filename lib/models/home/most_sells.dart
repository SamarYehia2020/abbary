import 'package:abbar_app/models/home/brand_model.dart';
import 'package:abbar_app/models/home/category_model.dart';

class TheMostSellsSingleProduct {
  int id;
  String title;
  String description;
  dynamic barcode;
  dynamic sku;
  int quantity;
  int minQuantity;
  var originalPrice;
  var finalPrice;
  String mainImage;
  List<dynamic> images;
  bool isFavorite;
  List<dynamic> categories;
  List<dynamic> options;
  dynamic unit;
  List<dynamic> groupsPricing;
  List<dynamic> brands;
  Map<String, dynamic> brand;

  TheMostSellsSingleProduct(
      {required this.id,
      required this.images,
      required this.quantity,
      required this.sku,
      required this.title,
      required this.unit,
      required this.categories,
      required this.finalPrice,
      required this.mainImage,
      required this.brands,
      required this.description,
      required this.minQuantity,
      required this.groupsPricing,
      required this.isFavorite,
      required this.originalPrice,
      required this.barcode,
      required this.options,
      required this.brand});
  factory TheMostSellsSingleProduct.fromJson(Map<String, dynamic> jsonData) {
    return TheMostSellsSingleProduct(
        id: jsonData["id"],
        images: jsonData["images"],
        barcode: jsonData["barcode"],
        description: jsonData["description"],
        originalPrice: jsonData["original_price"],
        finalPrice: jsonData["final_price"],
        isFavorite: jsonData["is_favorite"],
        minQuantity: jsonData["min_quantity"],
        title: jsonData["title"],
        sku: jsonData["sku"],
        unit: jsonData["unit"],
        quantity: jsonData["quantity"],
        mainImage: jsonData["main_image"],
        options: jsonData["options"],
        groupsPricing: jsonData["groups_pricing"],
        brands: jsonData["brands"],
        categories: jsonData["categories"],
        brand: jsonData["brand"]);
  }
}

class TheMostSellsListProduct {
  List<dynamic>? theMostSellsList;
  TheMostSellsListProduct({this.theMostSellsList});
  factory TheMostSellsListProduct.fromJson(Map<String, dynamic> jsondata) {
    return TheMostSellsListProduct(theMostSellsList: jsondata['data']);
  }
}
