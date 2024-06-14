import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';

class MarkAsViewedUseCase {
  Dio dio;
    SharedPreferences prefs;

  MarkAsViewedUseCase({required this.dio,required this.prefs});

  Future<void> markAsViewed(
      {required String postId, required String postType}) async {
    await dio.post(UrlRoutes.markAsViewed,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}),
        data: {
          "post_id": postId, "post_type": postType
        });
    // prefs.setStringList("post_id", postId);
  }
}
