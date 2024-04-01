import 'package:flutter/material.dart';

class CheckInternetConnectionProvider extends ChangeNotifier {
  bool isConnected = true;
  Future<void> internetConnected({required bool value}) async{
    isConnected = value;
    notifyListeners();
  }
}
