import 'package:skynet/data/models/transactions_model.dart';
import 'package:skynet/data/repositories/get_transactions_history.dart';
import 'package:skynet/domain/usecase/get_transactions_histor_usecase.dart';

class GetTransactionsHistoryRepoImpl implements GetTransactionsHistoryRepo{
  GetTransactionsHistoryRepoImpl({required this.useCase});
  @override
  Future<TransactionsModel> getTransactionsHistory()async {
    return await useCase.getTransactionHistory();
  }
  GetTransactionsHistoryUseCase useCase;
}