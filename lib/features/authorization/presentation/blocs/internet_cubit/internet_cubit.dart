import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit({required this.connectivity}) : super(InternetInitial()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile|| event == ConnectivityResult.wifi) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    });
  }




  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
