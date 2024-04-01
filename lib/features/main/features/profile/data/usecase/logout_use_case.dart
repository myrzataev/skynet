import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';

class LogOutUseCase {
  Dio dio;
  SharedPreferences prefs;

  LogOutUseCase({required this.dio, required this.prefs});
  Future<void> logOut() async {
    await dio.post(UrlRoutes.logOut,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
  }
}
