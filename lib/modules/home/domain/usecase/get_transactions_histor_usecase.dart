import 'package:dio/dio.dart';
import 'package:skynet/core/consts/app_consts.dart';
import 'package:skynet/core/consts/url_routes.dart';
import 'package:skynet/modules/home/data/models/transactions_model.dart';

class GetTransactionsHistoryUseCase {
  Dio dio;
  GetTransactionsHistoryUseCase({required this.dio});
  Future<TransactionsModel> getTransactionHistory() async {
    final Response response = await dio.post(UrlRoutes.transactions,
        data: {"ls_abonent": AppConsts.lsAbonent});
    return TransactionsModel.fromJson(response.data);
  }
}
