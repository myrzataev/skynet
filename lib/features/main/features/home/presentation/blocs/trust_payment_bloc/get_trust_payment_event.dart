part of 'get_trust_payment_bloc.dart';

@immutable
sealed class GetTrustPaymentEvent {}

class GetCreditEvent extends GetTrustPaymentEvent {}
