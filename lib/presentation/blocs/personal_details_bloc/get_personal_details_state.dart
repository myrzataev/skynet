part of 'get_personal_details_bloc.dart';

@immutable
sealed class GetPersonalDetailsState {}

final class GetPersonalDetailsInitial extends GetPersonalDetailsState {}

final class GetPersonalDetailsLoading extends GetPersonalDetailsState {}

final class GetPersonalDetailsSuccess extends GetPersonalDetailsState {
  ProfileDetailsModel model;
  GetPersonalDetailsSuccess({required this.model});
}

final class GetPersonalDetailsError extends GetPersonalDetailsState {
  final String errorText;
  GetPersonalDetailsError({required this.errorText});
}
