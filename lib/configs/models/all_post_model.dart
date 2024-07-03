class AllPostModel {
  String? title;
  String? featuredImage;
  String? shortContent;

  AllPostModel({this.title, this.featuredImage, this.shortContent});

  AllPostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    featuredImage = json['featured_image'];
    shortContent = json['short_content'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['title'] = title;
  //   data['featured_image'] = featuredImage;
  //   data['short_content'] = shortContent;
  //   return data;
  // }
}