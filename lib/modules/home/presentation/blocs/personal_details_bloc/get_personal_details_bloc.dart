import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/modules/home/data/models/profile_details_model.dart';
import 'package:skynet/modules/home/data/repositories/get_profile_details_repo.dart';

part 'get_personal_details_event.dart';
part 'get_personal_details_state.dart';

class GetPersonalDetailsBloc
    extends Bloc<GetPersonalDetailsEvent, GetPersonalDetailsState> {
  GetPersonalDetailsBloc({required this.repository})
      : super(GetPersonalDetailsInitial()) {
    on<GetPersonalDetailsEvent>((event, emit) async {
      emit(GetPersonalDetailsLoading());
      try {
        final model = await repository.getProfileDetails();
        emit(GetPersonalDetailsSuccess(model: model));
      } catch (e) {
        emit(GetPersonalDetailsError(errorText: e.toString()));
      }
    });
  }
  GetProfileDetailsRepo repository;
}
