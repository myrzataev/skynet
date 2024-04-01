import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/news/data/models/personal_news_model.dart';
import 'package:skynet/features/main/features/news/data/repositories/get_personal_news_impl.dart';

part 'personal_news_event.dart';
part 'personal_news_state.dart';

class PersonalNewsBloc extends Bloc<PersonalNewsEvent, PersonalNewsState> {
  GetPersonalNewsImpl repository;
  PersonalNewsBloc({required this.repository}) : super(PersonalNewsInitial()) {
    on<GetPersonalNewsEvent>((event, emit) async {
      emit(PersonalNewsLoading());
      try {
        final result = await repository.getPersonalNews();
        emit(PersonalNewsSuccess(model: result));
      } catch (e) {
        emit(PersonalNewsError(errorText: e.toString()));
      }
    });
  }
}
