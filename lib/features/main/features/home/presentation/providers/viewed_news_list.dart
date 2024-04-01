import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewedNewsProvider extends ChangeNotifier {
  SharedPreferences prefs;
  ViewedNewsProvider({required this.prefs});
  final List<String> viewedNewsList = [];
  void addToViewedNewsList({required String data}) {
    viewedNewsList.add(data);
    prefs.setStringList("viewedNewsList", viewedNewsList);
    print("this is viewed stories list ${prefs.getStringList("viewedNewsList")}");
    notifyListeners();
  }
}
