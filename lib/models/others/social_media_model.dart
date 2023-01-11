class SocialMediaModel {
  String facebook;
  String twitter;
  String whatsapp;
  String instagram;
  String snapchat;
  SocialMediaModel(
      {required this.facebook,
      required this.instagram,
      required this.snapchat,
      required this.twitter,
      required this.whatsapp});
  factory SocialMediaModel.fromJson(Map<String, dynamic> jsonData) {
    return SocialMediaModel(
        facebook: jsonData['facebook'],
        instagram: jsonData['instagram'],
        snapchat: jsonData['snapchat'],
        twitter: jsonData['twitter'],
        whatsapp: jsonData['whatsapp']);
  }
}
