class AboutModel {
  String? pageTitle;
  String? content;
  int? pageId;
  String? pageType;
  String? headerImage;
  String? headerText;

  AboutModel(
      {this.pageTitle,
      required this.content,
      this.headerImage,
      this.headerText,
      this.pageId,
      this.pageType});
  factory AboutModel.fromJson(Map<String, dynamic> jsonData) {
    return AboutModel(
        pageTitle: jsonData['pageTitle'] ?? '',
        content: jsonData['content'] ?? '',
        headerImage: jsonData['headerImage'] ?? '',
        headerText: jsonData['headerText'] ?? '',
        pageId: jsonData['pageId'] ?? '',
        pageType: jsonData['pageType'] ?? '');
  }
}
