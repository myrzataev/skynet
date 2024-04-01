import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/authorization/data/models/authorization_get_sms_model.dart';

class AuthorizationGetSmsCodeUseCase {
  Dio dio;
  SharedPreferences prefs;

  AuthorizationGetSmsCodeUseCase({
    required this.prefs,
    required this.dio,
  });

  Future<AuthorizationModel> authorizeGetSmsCode(
      {required String lsAbonent, required phoneNumber}) async {
    final Response response = await dio.post(UrlRoutes.authorization, data: {
      "ls_abonent": lsAbonent,
      "phone_number": phoneNumber,
      "firebase_token": prefs.getString("firebase_token")
    });

    await prefs.setString("token", response.data["token"]);
    await prefs.setString("ls_abonent", lsAbonent);
    // print(prefs.getString("ls_abonent"));
    // print("this is token${prefs.getString('token')}");
    // print(prefs.getString("firebase_token"));

    await prefs.setString("sms_token", response.data["sms_token"]);
    // print(prefs.getString("sms_token"));

    return AuthorizationModel.fromJson(response.data);
  }
}
