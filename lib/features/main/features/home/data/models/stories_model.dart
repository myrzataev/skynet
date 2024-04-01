// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';

List<StoryModel> storyModelFromJson(String str) => List<StoryModel>.from(json.decode(str).map((x) => StoryModel.fromJson(x)));

String storyModelToJson(List<StoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryModel {
    int id;
    String postType;
    String icon;
    String image;
    String title;
    DateTime createdAt;

    StoryModel({
        required this.id,
        required this.postType,
        required this.icon,
        required this.image,
        required this.title,
        required this.createdAt,
    });

    factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"],
        postType: json["post_type"],
        icon: json["icon"],
        image: json["image"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post_type": postType,
        "icon": icon,
        "image": image,
        "title": title,
        "created_at": createdAt.toIso8601String(),
    };
}
