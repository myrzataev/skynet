import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/features/main/features/home/data/models/transactions_model.dart';

class GetTransactionsHistoryUseCase {
  Dio dio;
     SharedPreferences prefs;

  GetTransactionsHistoryUseCase({required this.dio,required this.prefs});
  Future<TransactionsModel> getTransactionHistory() async {

    final Response response = await dio.post(UrlRoutes.transactions,
        data: {"ls_abonent": prefs.getString("ls_abonent")}, options: Options(headers: {
          "Authorization":"Token ${prefs.getString("token")}"
        }));
    return TransactionsModel.fromJson(response.data);
  }
}
