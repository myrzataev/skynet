part of 'imageprecashe_cubit.dart';

@immutable
sealed class ImageprecasheState {}

final class ImageprecasheInitial extends ImageprecasheState {}

final class ImageprecasheLoading extends ImageprecasheState {}

final class ImageprecasheSuccess extends ImageprecasheState {}

final class ImageprecasheError extends ImageprecasheState {}
