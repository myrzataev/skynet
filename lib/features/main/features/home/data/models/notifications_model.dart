class NotificationsModel {
  int? id;
  String? title;
  String? text;
  bool? viewed;
  String? createdAt;

  NotificationsModel(
      {this.id, this.title, this.text, this.viewed, this.createdAt});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    viewed = json['viewed'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    data['viewed'] = viewed;
    data['created_at'] = createdAt;
    return data;
  }
}
