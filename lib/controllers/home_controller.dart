import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;

  String btnText = "image";

  void updateIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      btnText = "image";
    }
    if (index == 1) {
      btnText = "live";
    }
    if (index == 2) {
      btnText = "video";
    }
    notifyListeners();
  }
}
