part of 'get_notifications_list_bloc.dart';

@immutable
sealed class GetNotificationsListState {}

final class GetNotificationsListInitial extends GetNotificationsListState {}

final class GetNotificationsLoading extends GetNotificationsListState {}

final class GetNotificationsSuccess extends GetNotificationsListState {
  final List<NotificationsModel> model;
  GetNotificationsSuccess({required this.model});
}

final class GetNotificationsError extends GetNotificationsListState {

}
