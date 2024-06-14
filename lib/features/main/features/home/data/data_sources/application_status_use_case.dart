import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/home/data/models/application_status.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

class ApplicationStatusUseCase {
  final Dio dio;
  final SharedPreferences prefs;
  ApplicationStatusUseCase({required this.dio, required this.prefs});
  Future<List<ApplicationStatusEntity>> getApplicationStatus() async {
    final Response response = await dio.get(UrlRoutes.applicationStatus,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
    List list = response.data;
    return list.map((e) => ApplicationModel.fromJson(e).toEntity()).toList();
    // final result = ApplicationModel.fromJson(response.data);
    // debugPrint(result.toString());
  }
}
