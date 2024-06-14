import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/news/data/models/local_news_model.dart';

class GetLocalNewsUseCase {
  Dio dio;
  SharedPreferences prefs;

  GetLocalNewsUseCase({required this.dio, required this.prefs});
  Future<Iterable<LocalNewsModel>> getLocalNews() async {
    String? encodedString = prefs.getString("ip_address");
    String ipAddress = Uri.decodeComponent(encodedString ?? "").replaceAll(
        RegExp(
          r'[{}]',
        ),
        '');
    final Response response = await dio.get("${UrlRoutes.localNews}?",
        queryParameters: {"ip": ipAddress},
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));

    final List result = response.data;
    print(response.data);

    return result.map((e) => LocalNewsModel.fromJson(e)).toList();
  }
}
