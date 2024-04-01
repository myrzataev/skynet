part of 'new_list_bloc.dart';

@immutable
sealed class NewListState {}

final class NewListInitial extends NewListState {}

final class NewListLoading extends NewListState {}

final class NewListSuccess extends NewListState {
  final List<NewsModel> model;
  NewListSuccess({required this.model});
}

final class NewListError extends NewListState {
  final String errorText;
  NewListError({required this.errorText});
}

