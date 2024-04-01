import 'package:skynet/features/main/features/home/data/models/stories_model.dart';
import 'package:skynet/features/main/features/home/domain/repositories/get_stories_repo.dart';
import 'package:skynet/features/main/features/home/data/usecase/get_stories_usecase.dart';

class GetStoriesRepositoryImpl implements GetStoriesRepository {
  GetStoriesUseCase useCase;
  GetStoriesRepositoryImpl({required this.useCase});
  @override
  Future<Iterable<StoryModel>> getStories() async {
    return useCase.getStories();
  }
}
