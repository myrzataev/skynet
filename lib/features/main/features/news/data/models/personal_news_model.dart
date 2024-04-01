class PersonalNewsModel {
  int? id;
  String? postType;
  String? image;
  String? title;
  String? text;
  String? createdAt;

  PersonalNewsModel(
      {this.id,
      this.postType,
      this.image,
      this.title,
      this.text,
      this.createdAt});

  PersonalNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postType = json['post_type'];
    image = json['image'];
    title = json['title'];
    text = json['text'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_type'] = postType;
    data['image'] = image;
    data['title'] = title;
    data['text'] = text;
    data['created_at'] = createdAt;
    return data;
  }
}
