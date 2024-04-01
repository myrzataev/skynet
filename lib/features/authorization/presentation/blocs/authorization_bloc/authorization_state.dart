part of 'authorization_bloc.dart';

@immutable
sealed class AuthorizationState {}

final class AuthorizationInitial extends AuthorizationState {}

final class AuthorizationLoading extends AuthorizationState {}

final class AuthorizationSuccess extends AuthorizationState {
  final AuthorizationModel model;
  AuthorizationSuccess({required this.model});
}

final class AuthorizationError extends AuthorizationState {
  final String errorText;
  AuthorizationError({required this.errorText});

}
