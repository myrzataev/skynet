

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    int id;
    String postType;
    String image;
    String title;
    String text;
    DateTime createdAt;

    NewsModel({
        required this.id,
        required this.postType,
        required this.image,
        required this.title,
        required this.text,
        required this.createdAt,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        postType: json["post_type"],
        image: json["image"],
        title: json["title"],
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post_type": postType,
        "image": image,
        "title": title,
        "text": text,
        "created_at": createdAt.toIso8601String(),
    };
}
