part of 'mark_notification_as_viewed_bloc.dart';

@immutable
sealed class MarkNotificationAsViewedState {}

final class MarkNotificationAsViewedInitial
    extends MarkNotificationAsViewedState {}

final class MarkNotificationAsViewedLoading
    extends MarkNotificationAsViewedState {}

final class MarkNotificationAsViewedSuccess
    extends MarkNotificationAsViewedState {}

final class MarkNotificationAsViewedError
    extends MarkNotificationAsViewedState {}
