class ConditionsModel {
  String? pageTitle;
  String? content;
  int? pageId;
  String? pageType;
  String? headerImage;
  String? headerText;

  ConditionsModel(
      {this.pageTitle,
      required this.content,
      this.headerImage,
      this.headerText,
      this.pageId,
      this.pageType});
  factory ConditionsModel.fromJson(Map<String, dynamic> jsonData) {
    return ConditionsModel(
        pageTitle: jsonData['pageTitle'] ?? '',
        content: jsonData['content'] ?? '',
        headerImage: jsonData['headerImage'] ?? '',
        headerText: jsonData['headerText'] ?? '',
        pageId: jsonData['pageId'] ?? '',
        pageType: jsonData['pageType'] ?? '');
  }
}
