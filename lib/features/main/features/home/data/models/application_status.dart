// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

import 'dart:convert';

import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

List<ApplicationModel> applicationFromJson(String str) =>
    List<ApplicationModel>.from(
        json.decode(str).map((x) => ApplicationModel.fromJson(x)));

String applicationToJson(List<ApplicationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationModel {
  String id;
  String title;
  String stageId;
  String lsAbon;
  String description;
  String arrivalDate;
  String executor;

  ApplicationModel({
    required this.id,
    required this.title,
    required this.stageId,
    required this.lsAbon,
    required this.description,
    required this.arrivalDate,
    required this.executor,
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
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "STAGE_ID": stageId,
        "LS_ABON": lsAbon,
        "DESCRIPTION": description,
        "ARRIVAL_DATE": arrivalDate,
        "EXECUTOR": executor,
      };
  ApplicationStatusEntity toEntity() {
    return ApplicationStatusEntity(
        id: id,
        title: title,
        stageId: stageId,
        lsAbon: lsAbon,
        description: description,
        arrivalDate: arrivalDate,
        executor: executor);
  }
}
