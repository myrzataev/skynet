import 'package:flutter/material.dart';

class SmsCodeProvider extends ChangeNotifier {
  late String smsCode;
  void setSmsCode({required String data}) {
    smsCode = data;
    notifyListeners();
  }
}
