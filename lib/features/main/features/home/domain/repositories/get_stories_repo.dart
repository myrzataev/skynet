import 'package:skynet/features/main/features/home/data/models/stories_model.dart';

abstract class GetStoriesRepository{
  Future<Iterable<StoryModel>> getStories();
}
