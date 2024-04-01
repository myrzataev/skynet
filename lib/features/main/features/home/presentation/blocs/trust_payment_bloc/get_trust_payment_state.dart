part of 'get_trust_payment_bloc.dart';

@immutable
sealed class GetTrustPaymentState {}

final class GetTrustPaymentInitial extends GetTrustPaymentState {}

final class GetTrustPaymentLoading extends GetTrustPaymentState {}

final class GetTrustPaymentSuccess extends GetTrustPaymentState {}

final class GetTrustPaymentError extends GetTrustPaymentState {
  final String errorText;
  GetTrustPaymentError({required this.errorText});
}
