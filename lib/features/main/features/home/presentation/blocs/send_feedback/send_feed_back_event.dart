part of 'send_feed_back_bloc.dart';

@immutable
class SendFeedBackEvent {
  final String bxId;
  final String feedBackText;
  final String feedBackMark;
 const  SendFeedBackEvent(
      {required this.bxId,
      required this.feedBackMark,
      required this.feedBackText});
}
