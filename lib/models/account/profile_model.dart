class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  Map<String, dynamic> city;

  ProfileModel(
      {this.name, this.email, this.phone, this.id, required this.city});
  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      name: jsonData['name'] ?? '',
      email: jsonData['email'] ?? '',
      phone: jsonData['phone'] ?? '',
      city: jsonData['city'] ?? '',
      id: jsonData['id'] ?? '',
    );
  }
}

class CityModel {
  int? cityId;
  String? cityName;
  CityModel({this.cityId, this.cityName});
  factory CityModel.fromJson(Map<String, dynamic> cityData) {
    return CityModel(cityId: cityData['id'], cityName: cityData['name']);
  }
}
