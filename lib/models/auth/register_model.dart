import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data);

class RegisterModel {
  final String? name;
  final String? phone;
  final int? city_id;
  final String? pass;
  final String? confirm_pass;
  final String? email;
  RegisterModel(
      {required this.name,
      required this.phone,
      required this.city_id,
      required this.pass,
      required this.confirm_pass,
      required this.email});
  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
        name: jsonData['name'],
        phone: jsonData['phone'],
        city_id: jsonData['city_id'],
        confirm_pass: jsonData['password_confirmation'],
        pass: jsonData['password'],
        email: jsonData['email']);
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'password': pass,
        'password_confirmation': confirm_pass,
        'city_id': city_id
      };
}
