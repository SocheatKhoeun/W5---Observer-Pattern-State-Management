import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;

  void incrementRedTap() {
    redTapCount++;
    notifyListeners(); 
  }

  void incrementBlueTap() {
    blueTapCount++;
    notifyListeners(); 
  }
}