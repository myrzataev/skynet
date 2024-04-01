part of 'mark_as_viewed_cubit.dart';

@immutable
sealed class MarkAsViewedState {}

final class MarkAsViewedInitial extends MarkAsViewedState {}

final class MarkAsViewedLoading extends MarkAsViewedState {}

final class MarkAsViewedSuccess extends MarkAsViewedState {}

final class MarkAsViewedError extends MarkAsViewedState {}
