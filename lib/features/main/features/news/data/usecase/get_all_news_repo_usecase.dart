import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/news/data/models/news_model.dart';

class GetAllNewsRepositoryUseCase {
  Dio dio;
  SharedPreferences prefs;

  GetAllNewsRepositoryUseCase({required this.dio, required this.prefs});
  Future<List<NewsModel>> getAllNews() async {
    final Response response = await dio.get(UrlRoutes.news,
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
    print(response.runtimeType);
    List<dynamic> result = response.data;
    final List<NewsModel> listModel =
        result.map((e) => NewsModel.fromJson(e)).toList();
    return listModel;
  }
}
