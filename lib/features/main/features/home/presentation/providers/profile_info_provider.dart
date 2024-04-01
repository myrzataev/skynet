import 'package:flutter/material.dart';
import 'package:skynet/features/main/features/home/data/models/profile_details_model.dart';

class GetProfileInfoProvider extends ChangeNotifier {
  ProfileDetailsModel? model;
  void getNameAddress(ProfileDetailsModel data) {
    model = data;
    notifyListeners();
  }
}
