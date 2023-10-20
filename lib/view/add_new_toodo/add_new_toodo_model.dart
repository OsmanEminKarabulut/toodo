import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/product/constants/strings.dart';
import 'package:toodo/view/add_new_toodo/add_new_toodo_view.dart';
import 'package:toodo/view/add_new_toodo/new_to_do/new_to_do_state.dart';

abstract class AddNewToodoModel extends State<AddNewToodoView>
    with Paddings, Strings {
  final TextEditingController newTodoTitleController = TextEditingController();
  final TextEditingController newTodoSubtitleController =
      TextEditingController();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  List<ToodoTodo> todos = [];

  void addNewTodo(ToodoTodo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void saveAndReturn(context) {
    if (titleController.text.isNotEmpty || subtitleController.text.isNotEmpty) {
      String title = titleController.text;
      String subtitle = subtitleController.text;
      int id = Provider.of<ToodoData>(context, listen: false).getNewToodoId();
      Toodo toodo = Toodo(title, subtitle, id, todos);
      Provider.of<ToodoData>(context, listen: false).addNewToodo(toodo);
      Provider.of<PageViewState>(context, listen: false).navigateToToodoPage();
      titleController.clear();
      subtitleController.clear();
    }
  }

  void newTodoFunction(context) {
    bool _isVisible =
        Provider.of<NewTodoWidgetState>(context, listen: false).isVisible;
    bool _isTitleControllerEmpty = newTodoTitleController.text.isEmpty;
    bool _isSubtitleControllerEmpty = newTodoSubtitleController.text.isEmpty;
    if (_isVisible) {
      if (_isTitleControllerEmpty || _isSubtitleControllerEmpty) {
        Provider.of<NewTodoWidgetState>(context, listen: false)
            .changeVisibility();
      } else {
        String title = newTodoTitleController.text;
        String subtitle = newTodoSubtitleController.text;
        bool isChecked = false;
        int id = todos.length;
        int toodoId =
            Provider.of<ToodoData>(context, listen: false).getNewToodoId();
        ToodoTodo toodo = ToodoTodo(title, subtitle, isChecked, id, toodoId);

        Provider.of<NewTodoWidgetState>(context, listen: false)
            .changeVisibility();
        newTodoTitleController.clear();
        newTodoSubtitleController.clear();
        addNewTodo(toodo);
      }
    } else {
      Provider.of<NewTodoWidgetState>(context, listen: false)
          .changeVisibility();
    }
  }
}
