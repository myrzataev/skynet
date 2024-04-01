part of 'personal_news_bloc.dart';

@immutable
sealed class PersonalNewsState {}

final class PersonalNewsInitial extends PersonalNewsState {}

final class PersonalNewsLoading extends PersonalNewsState {}

final class PersonalNewsSuccess extends PersonalNewsState {
  final List<PersonalNewsModel> model;
  PersonalNewsSuccess({required this.model});
}

final class PersonalNewsError extends PersonalNewsState {
  final String errorText;
  PersonalNewsError({required this.errorText});
}
