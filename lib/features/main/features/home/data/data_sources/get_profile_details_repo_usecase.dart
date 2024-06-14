import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/home/data/models/profile_details_model.dart';

class GetProfileDetailsUseCase {
  Dio dio;
  SharedPreferences prefs;

  GetProfileDetailsUseCase({
    required this.dio,
    required this.prefs
  });
  Future<ProfileDetailsModel> getProfileDetails() async {
    final Response response = await dio.post(
      UrlRoutes.balance,
        data: {"ls_abonent": prefs.getString("ls_abonent")},
        options: Options(
            headers: {"Authorization": "Token ${prefs.getString("token")}"}));
    print(
        "this is token and it is working correct: ${prefs.getString("token")}");
    print(response.data);

    return ProfileDetailsModel.fromJson(response.data);
  }
}



// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skynet/core/consts/url_routes.dart';
// import 'package:skynet/features/main/features/home/data/models/profile_details_model.dart';

// class GetProfileDetailsUseCase {
//  final Dio dio = Dio();
//   SharedPreferences prefs;

//   GetProfileDetailsUseCase({

//     required this.prefs
//   });
//   Future<ProfileDetailsModel> getProfileDetails() async {
//     final Response response = await dio.post(
//      "http://10.1.2.100:8001${UrlRoutes.balance}",
//         data: {"ls_abonent": prefs.getString("ls_abonent")},
//         // options: Options(
//         //     // headers: {"Authorization": "Token ${prefs.getString("token")}"}
//         //     )
//             );
//     print(
//         "this is token and it is working correct: ${prefs.getString("token")}");
//     print(response.data);

//     return ProfileDetailsModel.fromJson(response.data);
//   }
// }
