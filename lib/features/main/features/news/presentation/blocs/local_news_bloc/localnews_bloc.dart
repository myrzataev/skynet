import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/news/data/models/local_news_model.dart';
import 'package:skynet/features/main/features/news/data/repositories/get_local_news_impl.dart';

part 'localnews_event.dart';
part 'localnews_state.dart';

class LocalnewsBloc extends Bloc<LocalnewsEvent, LocalnewsState> {
  GetLocalNewsRepositoryImpl repositoryImpl;
  LocalnewsBloc({required this.repositoryImpl}) : super(LocalnewsInitial()) {
    on<GetLocalnewsEvent>((event, emit) async{
      emit(LocalnewsLoading());
      try {
        var result = await repositoryImpl.getLocalNews();
        emit(LocalnewsSuccess(model: result));
      } catch (_) {
        emit(LocalnewsError());
      }
    });
  }
}
