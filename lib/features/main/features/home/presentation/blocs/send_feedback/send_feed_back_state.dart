part of 'send_feed_back_bloc.dart';

@immutable
sealed class SendFeedBackState {}

final class SendFeedBackInitial extends SendFeedBackState {}

final class SendFeedBackLoading extends SendFeedBackState {}

final class SendFeedBackSuccess extends SendFeedBackState {}

final class SendFeedBackError extends SendFeedBackState {
  
}
