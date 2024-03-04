import 'package:skynet/modules/home/data/models/transactions_model.dart';

abstract class GetTransactionsHistoryRepo{
  Future <TransactionsModel> getTransactionsHistory();
}