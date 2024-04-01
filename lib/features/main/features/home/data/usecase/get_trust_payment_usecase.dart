import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';

class GetTrustPaymentUseCase {
  Dio dio;
  SharedPreferences prefs;

  GetTrustPaymentUseCase({required this.dio, required this.prefs});
  Future<void> getTrustPayment() async {
    await dio.post(UrlRoutes.getTrustPayment,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}),
        data: {"ls_abonent": prefs.getString("ls_abonent")});
  }
}
