part of 'localnews_bloc.dart';

@immutable
sealed class LocalnewsState {}

final class LocalnewsInitial extends LocalnewsState {}

final class LocalnewsLoading extends LocalnewsState {}

// ignore: must_be_immutable
final class LocalnewsSuccess extends LocalnewsState {
  Iterable<LocalNewsModel> model;
  LocalnewsSuccess({required this.model});
}

final class LocalnewsError extends LocalnewsState {}
