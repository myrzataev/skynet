import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarkNotificationAsViewedDs {
  final Dio dio;
  final SharedPreferences preferences;
  MarkNotificationAsViewedDs({required this.dio, required this.preferences});
  Future<void> markAsViewed({required int id}) async {
    await dio.post("http://91.210.169.237:8001/mark_notification_viewed/$id/",
        options: Options(headers: {
          "Authorization": "Token ${preferences.getString("token")}"
        }));
  }
}
