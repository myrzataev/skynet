import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skynet/features/main/features/home/data/models/stories_model.dart';
import 'package:skynet/features/main/features/home/data/repositories/get_stories_repo_impl.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  GetStoriesRepositoryImpl repositoryImpl;
  StoriesBloc({required this.repositoryImpl}) : super(StoriesInitial()) {
    on<StoriesEvent>((event, emit) async {
      emit(StoriesLoading());
      try {
        final Iterable<StoryModel> result = await repositoryImpl.getStories();
        emit(StoriesSuccess(stories: result));
      } catch (e) {
        emit(StoriesError(errortext: e.toString()));
      }
    });
  }
}
