import 'package:skynet/data/models/transactions_model.dart';

abstract class GetTransactionsHistoryRepo{
  Future <TransactionsModel> getTransactionsHistory();
}