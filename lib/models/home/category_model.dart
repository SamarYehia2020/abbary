import 'dart:convert';

class SingleCategory {
  int? id;
  String? name;
  String? description;
  List? children;
  String? image;
  SingleCategory(
      {this.id, this.image, this.name, this.description, this.children});
  factory SingleCategory.fromJson(Map<String, dynamic> jsonData) {
    return SingleCategory(
        id: jsonData['id'],
        name: jsonData['name'],
        image: jsonData['image'],
        description: jsonData['description'],
        children: jsonData['children']);
  }
}

class Categories {
  List<dynamic> categoryList;
  Categories({required this.categoryList});
  factory Categories.fromJson(Map<String, dynamic> jsondata) {
    return Categories(categoryList: jsondata['data']);
  }
}
