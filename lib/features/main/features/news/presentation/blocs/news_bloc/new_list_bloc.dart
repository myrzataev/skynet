import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/news/data/models/news_model.dart';
import 'package:skynet/features/main/features/news/domain/repositories/get_all_news_repo.dart';

part 'new_list_event.dart';
part 'new_list_state.dart';

class NewListBloc extends Bloc<NewListEvent, NewListState> {
  NewListBloc({required this.repository}) : super(NewListInitial()) {
    on<NewListEvent>((event, emit) async {
      emit(NewListLoading());

      try {
        final List<NewsModel> result = await repository.getAllNewsMethod();
        emit(NewListSuccess(model: result));
      } catch (e) {
        emit(NewListError(errorText: e.toString()));
      }
    });
  }
  final GetAllNewsRepository repository;
}
