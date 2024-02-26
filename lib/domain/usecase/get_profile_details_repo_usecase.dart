import 'package:dio/dio.dart';
import 'package:skynet/core/consts/app_consts.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/data/models/profile_details_model.dart';

class GetProfileDetailsUseCase {
  Dio dio;
  GetProfileDetailsUseCase({required this.dio});
  Future<ProfileDetailsModel> getProfileDetails() async {
    final Response response = await dio.post(UrlRoutes.balance, data: {
      "ls_abonent": AppConsts.lsAbonent
    });
    print(response.data);
    return ProfileDetailsModel.fromJson(response.data);
  }
}
