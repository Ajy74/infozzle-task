class AllPostModel {
  int? id;
  String? title;
  String? featuredImage;
  String? shortContent;

  AllPostModel({this.id, this.title, this.featuredImage, this.shortContent});

  AllPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    featuredImage = json['featured_image'];
    shortContent = json['short_content'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['featured_image'] = featuredImage;
  //   data['short_content'] = shortContent;
  //   return data;
  // }
}