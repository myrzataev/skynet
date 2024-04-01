import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/news/data/models/personal_news_model.dart';

class GetPersonalNewsRepositoryUseCase {
  final Dio dio;
  SharedPreferences prefs;

  GetPersonalNewsRepositoryUseCase({required this.dio, required this.prefs});
  Future<List<PersonalNewsModel>> getPersonalNews() async {
    print("getPersonalNewsFunctionworked");
    final Response response = await dio.get(
        "${UrlRoutes.personalNews}?ls_abonent=${int.parse(prefs.getString("ls_abonent") ?? "")}",
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
    print(response.data);
    List<dynamic> result = response.data;
    final List<PersonalNewsModel> listModel =
        result.map((e) => PersonalNewsModel.fromJson(e)).toList();
    return listModel;
  }
}
