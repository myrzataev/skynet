part of 'localnews_bloc.dart';

@immutable
sealed class LocalnewsEvent {}

class GetLocalnewsEvent extends LocalnewsEvent {}
