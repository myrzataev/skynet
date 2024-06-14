// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

// To parse this JSON data, do
//
//     final applicationModel = applicationModelFromJson(jsonString);

import 'dart:convert';

import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

List<ApplicationModel> applicationModelFromJson(String str) =>
    List<ApplicationModel>.from(
        json.decode(str).map((x) => ApplicationModel.fromJson(x)));

String applicationModelToJson(List<ApplicationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationModel {
  String? id;
  String? title;
  String? stageId;
  String? lsAbon;
  String? description;
  String? arrivalDate;
  String? executor;
  String? photo;
  String? phone;

  ApplicationModel({
    this.id,
    this.title,
    this.stageId,
    this.lsAbon,
    this.description,
    this.arrivalDate,
    this.executor,
    this.photo,
    this.phone,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      ApplicationModel(
        id: json["ID"],
        title: json["TITLE"],
        stageId: json["STAGE_ID"],
        lsAbon: json["LS_ABON"],
        description: json["DESCRIPTION"],
        arrivalDate: json["ARRIVAL_DATE"],
        executor: json["EXECUTOR"],
        photo: json["PHOTO"],
        phone: json["PHONE"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "STAGE_ID": stageId,
        "LS_ABON": lsAbon,
        "DESCRIPTION": description,
        "ARRIVAL_DATE": arrivalDate,
        "EXECUTOR": executor,
        "PHOTO": photo,
        "PHONE": phone,
      };
  ApplicationStatusEntity toEntity() {
    return ApplicationStatusEntity(
        id: id,
        title: title,
        stageId: stageId,
        lsAbon: lsAbon,
        description: description,
        arrivalDate: arrivalDate,
        executor: executor,
        phone: phone,
        photo: photo);
  }
}
