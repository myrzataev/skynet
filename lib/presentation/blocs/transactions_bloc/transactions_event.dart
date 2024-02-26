part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsEvent {}
class GetTransactionsHistoryEvent extends TransactionsEvent{}
