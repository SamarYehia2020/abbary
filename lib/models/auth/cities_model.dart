class Cities {
  final List<dynamic> cities;
  Cities({required this.cities});
  factory Cities.fromJson(Map<String, dynamic> cityList) {
    return Cities(cities: cityList['data']);
  }
}
