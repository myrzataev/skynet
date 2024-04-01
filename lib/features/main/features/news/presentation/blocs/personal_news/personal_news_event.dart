part of 'personal_news_bloc.dart';

@immutable
sealed class PersonalNewsEvent {}

class GetPersonalNewsEvent extends PersonalNewsEvent {}
