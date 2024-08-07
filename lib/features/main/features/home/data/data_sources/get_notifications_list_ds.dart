import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/features/main/features/home/data/models/notifications_model.dart';

class GetNotificationsListDs {
  final Dio dio;
  final SharedPreferences preferences;
  GetNotificationsListDs({required this.dio, required this.preferences});
  Future<List<NotificationsModel>> getNotificationsList() async {
    final Response response = await dio.get(
        "http://91.210.169.237:8001/notification_list/${preferences.getString("ls_abonent")}/",
        options: Options(headers: {
          "Authorization": "Token ${preferences.getString("token")}"
        }));
    List responseData = response.data;
    return responseData
        .map((toElement) => NotificationsModel.fromJson(toElement))
        .toList();
  }
}
