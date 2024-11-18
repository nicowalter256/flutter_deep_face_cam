import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<Map<String, dynamic>> useCases = [
    {"id": 1, "name": "Usecase 1"},
    {"id": 2, "name": "Usecase 2"},
    {"id": 3, "name": "Usecase 3"}
  ];
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
