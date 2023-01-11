class SingleSlider {
  String? title;
  String? link;
  String? image;
  String? targetType;
  int? targetId;
  List<dynamic>? positions;

  SingleSlider(
      {this.title,
      this.image,
      this.link,
      this.targetType,
      this.targetId,
      this.positions});
  factory SingleSlider.fromJson(Map<String, dynamic> jsonData) {
    return SingleSlider(
      title: jsonData['title'],
      image: jsonData['image'],
      link: jsonData['link'],
      targetType: jsonData['target_type'],
      targetId: jsonData['target_id'],
      positions: jsonData['positions'],
    );
  }
}

/**List of Slider */

class ListSlider {
  List<dynamic> sliderList;

  ListSlider({
    required this.sliderList,
  });
  factory ListSlider.fromJson(Map<String, dynamic> json) {
    return ListSlider(
      sliderList: json['data'],
    );
  }
}
