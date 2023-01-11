class BrandsList {
  List<dynamic> brandList;
  BrandsList({required this.brandList});
  factory BrandsList.fromJson(Map<String, dynamic> jsonData) {
    return BrandsList(brandList: jsonData['data']);
  }
}

class SingleBrand {
  int id;
  String name;
  String imgUrl;
  int itemsCount;

  SingleBrand(
      {required this.id,
      required this.name,
      required this.imgUrl,
      required this.itemsCount});
  factory SingleBrand.fromJson(Map<String, dynamic> jsonData) {
    return SingleBrand(
        id: jsonData['id'],
        name: jsonData['name'],
        imgUrl: jsonData['image'],
        itemsCount: jsonData['items_count']);
  }
}
// class SingleBrand {
//   int id;
//   String image;
//   dynamic url;
//   String createdAt;
//   String updatedAt;
//   int status;
//   String name;
//   dynamic descrption;
//   Map<String, dynamic> pivot;
//   SingleBrand(
//       {required this.id,
//       required this.image,
//       required this.url,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.status,
//       required this.name,
//       required this.descrption,
//       required this.pivot});
//   factory SingleBrand.fromJson(Map<String, dynamic> jsonData) {
//     return SingleBrand(
//         id: jsonData["id"],
//         url: jsonData["url"],
//         image: jsonData["image"],
//         name: jsonData["name"],
//         status: jsonData["status"],
//         createdAt: jsonData["created_at"],
//         updatedAt: jsonData["updated_at"],
//         descrption: jsonData["description"],
//         pivot: jsonData["pivot"]);
//   }
// }

// class BrandList {
//   List<SingleBrand>? brandList;
//   BrandList({this.brandList});
//   factory BrandList.fromJson(Map<String, dynamic> jsondata) {
//     return BrandList(brandList: jsondata['brands']);
//   }
// }

// class Pivot {
//   Pivot({
//     this.itemId,
//     this.brandId,
//   });

//   int? itemId;
//   int? brandId;

//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         itemId: json["item_id"],
//         brandId: json["brand_id"],
//       );
// }
