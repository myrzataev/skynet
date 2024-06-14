import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';

class SendFeedBackDataSource {
  final Dio dio;
  final SharedPreferences prefs;
  SendFeedBackDataSource({required this.dio, required this.prefs});
  Future<void> sendFeedBack(
      {required String bxId,
      required feedBackText,
      required String mark}) async {
    await dio.post(UrlRoutes.feedBack,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}),
        data: {
          "bx_deal_id": bxId,
          "review_text": feedBackText,
          "review_mark": mark
        });
  }
}
