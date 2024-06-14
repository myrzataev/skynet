import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';

class ConfirmCodeRepository {
  Dio dio;
  final SharedPreferences prefs;

  ConfirmCodeRepository({required this.dio, required this.prefs});
  Future<void> confirmCode({required String code}) async {
    await dio.post(UrlRoutes.verifyCode,
        data: {"sms_token": prefs.getString("sms_token"), "code": code});
    prefs.setString("sms", code);
  }
}
