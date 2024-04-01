import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/home/data/models/application_status.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

class ApplicationStatusUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  ApplicationStatusUseCase({required this.dio, required this.prefs});
  Future<ApplicationStatusEntity> getApplicationStatus() async {
    final Response response = await dio.get(UrlRoutes.applicationStatus,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
    final result = ApplicationModel.fromJson(response.data);
    debugPrint(result.toString());
    return result.toEntity();
  }
}
