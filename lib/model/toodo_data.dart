import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToodoData extends ChangeNotifier {
  //Toodos List

  List<ToodoTodo> toodos = [];

  //Toodos Storage Data

  final toodoBox = Hive.box("toodoBox");

  void loadToodos() {
    List<ToodoTodo> toodosFormatted = [];
    if (toodoBox.get("all_toodos") != null) {
      for (List<dynamic> toodo in toodoBox.get("all_toodos")) {
        toodosFormatted.add(ToodoTodo(toodo[0], toodo[1], toodo[2], toodo[3]));
      }
    }
    toodos = toodosFormatted;
  }

  void saveToodos() {
    List<List<dynamic>> toodosFormatted = [];
    if (toodos.isNotEmpty) {
      for (ToodoTodo toodo in toodos) {
        toodosFormatted
            .add([toodo.title, toodo.subtitle, toodo.isChecked, toodo.id]);
      }
    }
    toodoBox.put("all_toodos", toodosFormatted);
  }

  //Toodos Functions

  int getNewToodoId() {
    return toodos.length;
  }

  void addNewToodo(ToodoTodo toodo) {
    toodos.add(toodo);
    saveToodos();
    notifyListeners();
  }

  void removeToodoById(int id) {
    for (int i = 0; i < toodos.length; i++) {
      ToodoTodo toodo = toodos[i];
      if (toodo.id == id) {
        toodos.remove(toodo);
      }
    }
    saveToodos();
    notifyListeners();
  }

  ToodoTodo getToodoTodoByIndex(int index) {
    return toodos[index];
  }

  void toodoTodoChecked(ToodoTodo toodo) {
    toodo.checkButton();
    saveToodos();
    notifyListeners();
  }
}

class ToodoTodo {
  final String title;
  final String subtitle;
  bool isChecked;
  final int id;

  ToodoTodo(this.title, this.subtitle, this.isChecked, this.id);

  void checkButton() {
    isChecked = !isChecked;
  }
}
