part of 'application_status_bloc.dart';

@immutable
sealed class ApplicationStatusEvent {}

class GetApplicationStatusEvent extends ApplicationStatusEvent {}
