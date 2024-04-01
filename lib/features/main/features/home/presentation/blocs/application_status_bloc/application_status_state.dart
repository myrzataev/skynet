part of 'application_status_bloc.dart';

@immutable
sealed class ApplicationStatusState {}

final class ApplicationStatusInitial extends ApplicationStatusState {}

final class ApplicationStatusLoading extends ApplicationStatusState {}

final class ApplicationStatusSuccess extends ApplicationStatusState {
  final ApplicationStatusEntity entity;
  ApplicationStatusSuccess({required this.entity});
}

final class ApplicationStatusError extends ApplicationStatusState {}
