part of 'transactions_bloc.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsSuccess extends TransactionsState {
  final TransactionsModel model;
  TransactionsSuccess({required this.model});
}

final class TransactionsError extends TransactionsState {
  final String errorText;
  TransactionsError({required this.errorText});
}

