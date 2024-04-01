part of 'internet_cubit.dart';

enum ConnectionType { initialState, disconnected, connected }

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState {}

class InternetDisconnected extends InternetState {}
