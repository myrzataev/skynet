part of 'pay_cubit.dart';

@immutable
sealed class PayState {}

final class PayInitial extends PayState {}

final class PayLoading extends PayState {}

final class PaySuccess extends PayState {}

final class PayError extends PayState {}
