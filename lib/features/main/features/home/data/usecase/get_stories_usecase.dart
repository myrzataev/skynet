import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/home/data/models/stories_model.dart';

class GetStoriesUseCase {
  Dio dio;
  SharedPreferences prefs;

  GetStoriesUseCase({required this.dio, required this.prefs});
  Future<Iterable<StoryModel>> getStories() async {
    final Response response = await dio.get(UrlRoutes.stories,
        data: {"ls_abonent": prefs.getString("ls_abonent")},
        options: Options(
            receiveTimeout: const Duration(seconds: 60),
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));

    // final Response response = await dio.get(UrlRoutes.stories,
    //     data: {"ls_abonent": prefs.getString("ls_abonent")});
    List result = response.data;
    return result.map((e) => StoryModel.fromJson(e));
  }
}
