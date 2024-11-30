import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;

  bool processed = false;

  String btnText = "Process image";
  String cardText = "Input image";
  String targetText = "Target image";

  List<Map<String, dynamic>> switchOtions = [
    {"id": 1, "name": "Keep fps", "status": true},
    {"id": 2, "name": "Keep frames", "status": false},
    {"id": 3, "name": "Keep audio", "status": true}
  ];

  void updateIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      btnText = "Process image";
      cardText = "Input image";
      targetText = "Target image";
    }
    if (index == 1) {
      btnText = "Try live";
      cardText = "Input image";
      targetText = "Target image";
    }
    if (index == 2) {
      btnText = "Process video";
      cardText = "Target video";
      targetText = "Input image";
    }
    notifyListeners();
  }
}
