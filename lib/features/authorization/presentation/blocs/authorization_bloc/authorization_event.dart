part of 'authorization_bloc.dart';

@immutable
sealed class AuthorizationEvent {}
class AuthorizationGetSmsEvent extends AuthorizationEvent{
  final String lsAbonent;
  final String phoneNumber;
  AuthorizationGetSmsEvent({required this.lsAbonent, required this.phoneNumber});
}
