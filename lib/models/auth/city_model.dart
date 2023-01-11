class CityModel {
  int? id;
  String? name;
  int? product_count;
  CityModel({this.id, this.name, this.product_count});
  factory CityModel.fromJson(Map<String, dynamic> cityData) {
    return CityModel(
        id: cityData['id'],
        name: cityData['name'],
        product_count: cityData['products_count']);
  }
}
