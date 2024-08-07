import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/repositories/mark_notification_as_viewed_impl.dart';

part 'mark_notification_as_viewed_event.dart';
part 'mark_notification_as_viewed_state.dart';

class MarkNotificationAsViewedBloc
    extends Bloc<MarkNotificationAsViewedEvent, MarkNotificationAsViewedState> {
  MarkNotificationAsViewedImpl repoImpl;
  MarkNotificationAsViewedBloc({required this.repoImpl})
      : super(MarkNotificationAsViewedInitial()) {
    on<MarkNotificationAsViewedEventFromUI>((event, emit) async {
      emit(MarkNotificationAsViewedLoading());
      try {
        await repoImpl.markAsViewed(id: event.id);
        emit(MarkNotificationAsViewedSuccess());
      } catch (_) {
        emit(MarkNotificationAsViewedError());
      }
    });
  }
}
