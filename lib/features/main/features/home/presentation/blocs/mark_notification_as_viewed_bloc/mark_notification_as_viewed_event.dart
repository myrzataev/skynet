part of 'mark_notification_as_viewed_bloc.dart';

@immutable
sealed class MarkNotificationAsViewedEvent {}

class MarkNotificationAsViewedEventFromUI
    extends MarkNotificationAsViewedEvent {
  final int id;
  MarkNotificationAsViewedEventFromUI({required this.id});
}
