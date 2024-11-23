import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;

  String btnText = "Process image";
  String cardText = "Select image";

  List<Map<String, dynamic>> switchOtions = [
    {"id": 1, "name": "Keep fps", "status": true},
    {"id": 2, "name": "Keep frames", "status": false},
    {"id": 3, "name": "Keep audio", "status": true}
  ];

  void updateIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      btnText = "Process image";
      cardText = "Select image";
    }
    if (index == 1) {
      btnText = "Try live";
      cardText = "Input image";
    }
    if (index == 2) {
      btnText = "Process video";
      cardText = "Select video";
    }
    notifyListeners();
  }
}
