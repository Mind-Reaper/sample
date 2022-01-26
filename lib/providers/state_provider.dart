import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier{

  int counter = 0;

  increment() {
    counter++;
    notifyListeners();

  }
}