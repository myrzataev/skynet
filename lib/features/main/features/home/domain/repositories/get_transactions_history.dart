import 'package:skynet/features/main/features/home/data/models/transactions_model.dart';

abstract class GetTransactionsHistoryRepo{
  Future <TransactionsModel> getTransactionsHistory();
}