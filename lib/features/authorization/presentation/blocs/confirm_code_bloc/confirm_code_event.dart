part of 'confirm_code_bloc.dart';

@immutable
sealed class ConfirmCodeEvent {}
class ConfirmsmsCodeEvent extends ConfirmCodeEvent{
  final String smsCode;

  ConfirmsmsCodeEvent({required this.smsCode});
}
