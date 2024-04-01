part of 'stories_bloc.dart';

@immutable
sealed class StoriesState {}

final class StoriesInitial extends StoriesState {}

final class StoriesLoading extends StoriesState {}

final class StoriesSuccess extends StoriesState {
  final Iterable<StoryModel> stories;
  StoriesSuccess({required this.stories});
}

final class StoriesError extends StoriesState {
  final String errortext;
  StoriesError({required this.errortext});
}
