part of 'confirm_code_bloc.dart';

@immutable
sealed class ConfirmCodeState {}

final class ConfirmCodeInitial extends ConfirmCodeState {}

final class ConfirmCodeLoading extends ConfirmCodeState {}

final class ConfirmCodeSucccess extends ConfirmCodeState {}

final class ConfirmCodeError extends ConfirmCodeState {
 
  final String errorText;
  ConfirmCodeError({ required this.errorText});
}
