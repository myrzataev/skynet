part of 'stories_bloc.dart';

@immutable
sealed class StoriesEvent {}

class GetStoriesEvent extends StoriesEvent {}
