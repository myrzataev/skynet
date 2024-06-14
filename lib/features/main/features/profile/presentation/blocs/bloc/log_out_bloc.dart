import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/profile/data/repositories/logout_impl.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutRepositoryImpl repositoryImpl;
  LogOutBloc({required this.repositoryImpl}) : super(LogOutInitial()) {
    on<LogOutFromAccountEvent>((event, emit) async {
      emit(LogOutLoading());
      try {
        await repositoryImpl.logOut();
        emit(LogOutSuccess());
      } catch (e) {
        emit(LogOutError());
      }
    });
  }
}
