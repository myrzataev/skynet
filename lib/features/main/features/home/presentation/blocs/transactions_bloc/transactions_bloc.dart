import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/models/transactions_model.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_transactions_histor_impl.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc({required this.repository}) : super(TransactionsInitial()) {
    on<TransactionsEvent>((event, emit) async {
      emit(TransactionsLoading());

      try {
        final result = await repository.getTransactionsHistory();
        emit(TransactionsSuccess(model: result));
      } catch (e) {
        emit(TransactionsError(errorText: e.toString()));
      }
    });
  }

  GetTransactionsHistoryRepoImpl repository;
}
