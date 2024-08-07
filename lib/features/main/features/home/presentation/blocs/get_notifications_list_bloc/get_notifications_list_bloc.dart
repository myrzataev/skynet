import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/models/notifications_model.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_notifications_list_impl.dart';

part 'get_notifications_list_event.dart';
part 'get_notifications_list_state.dart';

class GetNotificationsListBloc
    extends Bloc<GetNotificationsListEvent, GetNotificationsListState> {
  GetNotificationsListImpl repoImpl;
  GetNotificationsListBloc({required this.repoImpl})
      : super(GetNotificationsListInitial()) {
    on<GetNotificationsListEvent>((event, emit) async {
      emit(GetNotificationsLoading());
      try {
        final result = await repoImpl.getNotificationsList();
        emit(GetNotificationsSuccess(model: result));
      } catch (_) {
        emit(GetNotificationsError());
      }
    });
  }
}
