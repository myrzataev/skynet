import 'package:skynet/features/main/features/home/data/models/transactions_model.dart';
import 'package:skynet/features/main/features/home/domain/repositories/get_transactions_history.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_transactions_histor_usecase.dart';

class GetTransactionsHistoryRepoImpl implements GetTransactionsHistoryRepo{
  GetTransactionsHistoryRepoImpl({required this.useCase});
  @override
  Future<TransactionsModel> getTransactionsHistory()async {
    return await useCase.getTransactionHistory();
  }
  GetTransactionsHistoryUseCase useCase;
}