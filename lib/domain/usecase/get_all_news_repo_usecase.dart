import 'package:dio/dio.dart';
import 'package:skynet/core/consts/url_routes.dart';

class GetAllNewsRepositoryUseCase {
  Dio dio;
  GetAllNewsRepositoryUseCase({required this.dio});
  Future<List<dynamic>> getAllNews() async {
    final Response response = await dio.get(UrlRoutes.news);
    print(response.runtimeType);
    final List<dynamic> listModel = response.data;
    return listModel;
  }
}
