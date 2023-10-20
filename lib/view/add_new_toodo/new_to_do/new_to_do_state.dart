import 'package:flutter/material.dart';

class NewTodoWidgetState extends ChangeNotifier {
  bool isVisible = false;

  void changeVisibility() {
    isVisible = !isVisible;

    notifyListeners();
  }
}
