import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/repositories/send_feedback_impl.dart';

part 'send_feed_back_event.dart';
part 'send_feed_back_state.dart';

class SendFeedBackBloc extends Bloc<SendFeedBackEvent, SendFeedBackState> {
  SendFeedBackImpl impl;

  SendFeedBackBloc({required this.impl}) : super(SendFeedBackInitial()) {
    on<SendFeedBackEvent>((event, emit) async {
      emit(SendFeedBackLoading());
      try {
        impl.sendFeedBack(
            bxId: event.bxId,
            feedBackText: event.feedBackText,
            reviewMark: event.feedBackMark);
        emit(SendFeedBackSuccess());
      } catch (_) {
        emit(SendFeedBackError());
      }
    });
  }
}
