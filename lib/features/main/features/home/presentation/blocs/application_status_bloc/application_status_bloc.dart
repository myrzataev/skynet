import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/repositories/application_status_repo_impl.dart';
import 'package:skynet/features/main/features/home/domain/entity/application_status_entity.dart';

part 'application_status_event.dart';
part 'application_status_state.dart';

class ApplicationStatusBloc
    extends Bloc<ApplicationStatusEvent, ApplicationStatusState> {
  ApplicationStatusRepoImpl repository;
  ApplicationStatusBloc({required this.repository})
      : super(ApplicationStatusInitial()) {
    on<GetApplicationStatusEvent>((event, emit) async {
      emit(ApplicationStatusLoading());
      try {
        final result = await repository.applicationStatus();
        emit(ApplicationStatusSuccess(entity: result));
      } catch (e) {
        emit(ApplicationStatusError());
      }
    });
  }
}
