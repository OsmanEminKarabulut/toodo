import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToodoData extends ChangeNotifier {
  //Toodos List

  List<Toodo> toodos = [];

  //Toodos Storage Data

  final toodoBox = Hive.box("toodoBox");

  void loadToodos() {
    List<Toodo> toodoss = [];
    if (toodoBox.get("all_toodos") != null) {
      for (List<dynamic> toodo in toodoBox.get("all_toodos")) {
        final List<dynamic> todos = toodo[3];
        final List<ToodoTodo> todosFormatted = [];
        for (var i = 0; i < todos.length; i++) {
          ToodoTodo todo = ToodoTodo(
              todos[i][0], todos[i][1], todos[i][3], todos[i][2], todos[i][4]);
          todosFormatted.add(todo);
        }
        toodoss
            .add(Toodo(toodo[0], toodo[1], toodo[2], todosFormatted)); //TODO:
      }
    }
    toodos = toodoss;
  }

  void saveToodos() {
    List<List<dynamic>> toodoss = [];
    if (toodos.isNotEmpty) {
      for (Toodo toodo in toodos) {
        List<List<dynamic>> todos = [];
        for (int i = 0; i < toodo.todos.length; i++) {
          final String todoTitle = toodo.todos[i].title;
          final String todoSubtitle = toodo.todos[i].subtitle;
          final int todoId = toodo.todos[i].id;
          final bool todoIsChecked = toodo.todos[i].isChecked;
          todos.add([todoTitle, todoSubtitle, todoId, todoIsChecked, toodo.id]);
        }
        toodoss.add([toodo.title, toodo.subtitle, toodo.id, todos]);
      }
    }
    toodoBox.put("all_toodos", toodoss);
  }

  //toodo yenileneceğinde kullanılır.
  void toodoInitState() {
    loadToodos();
  }

  //Toodos Functions

  int getNewToodoId() {
    return toodos.length;
  }

  void addNewToodo(Toodo toodo) {
    toodos.add(toodo);
    saveToodos();
    notifyListeners();
  }

  void removeToodoById(int id) {
    for (int i = 0; i < toodos.length; i++) {
      Toodo toodo = toodos[i];
      if (toodo.id == id) {
        toodos.remove(toodo);
      }
    }
    saveToodos();
    notifyListeners();
  }

  void removeToodoTodoById(int toodoTodoId, int toodoId) {
    for (Toodo toodo in toodos) {
      if (toodo.id == toodoId) {
        for (int i = 0; i < toodo.todos.length; i++) {
          ToodoTodo selectedTodo = toodo.todos[i];
          if (selectedTodo.id == toodoTodoId) {
            toodo.todos.remove(selectedTodo);
          }
        }
      }
    }
    saveToodos();
    notifyListeners();
  }

  Toodo getToodoByIndex(int index) {
    return toodos[index];
  }

  Toodo? getToodoById(int id) {
    for (int i = 0; i < toodos.length; i++) {
      Toodo toodo = toodos[i];
      if (toodo.id == id) {
        return toodo;
      }
    }
    return null;
  }

  void toodoTodoChecked(toodoTodoId, toodoId) {
    Toodo? toodo;
    for (Toodo t in toodos) {
      if (t.id == toodoId) {
        toodo = t;
      }
    }
    if (toodo != null) {
      toodo.checkButton(toodoTodoId);
      saveToodos();
      notifyListeners();
    }
  }
}

class ToodoTodo {
  final String title;
  final String subtitle;
  bool isChecked;
  final int id;
  final int toodoId;

  ToodoTodo(this.title, this.subtitle, this.isChecked, this.id, this.toodoId);
}

class Toodo {
  final String title;
  final String subtitle;
  final int id;
  final List<ToodoTodo> todos;

  void checkButton(toodoTodoId) {
    for (ToodoTodo toodoTodo in todos) {
      if (toodoTodo.id == toodoTodoId) {
        toodoTodo.isChecked = !toodoTodo.isChecked;
      }
    }
  }

  Toodo(this.title, this.subtitle, this.id, this.todos);
}
