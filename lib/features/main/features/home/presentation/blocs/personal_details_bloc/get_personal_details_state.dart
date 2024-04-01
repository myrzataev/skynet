part of 'get_personal_details_bloc.dart';

@immutable
sealed class GetPersonalDetailsState {}

class GetPersonalDetailsInitial extends GetPersonalDetailsState {}

class GetPersonalDetailsLoading extends GetPersonalDetailsState {}


// ignore: must_be_immutable
class GetPersonalDetailsSuccess extends GetPersonalDetailsState {
  ProfileDetailsModel model;
  GetPersonalDetailsSuccess({required this.model});
}

class GetPersonalDetailsError extends GetPersonalDetailsState {
  final String errorText;
  GetPersonalDetailsError({required this.errorText});
}
