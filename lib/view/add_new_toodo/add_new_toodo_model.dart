import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';

abstract class AddNewToodoModel extends StatelessWidget with Paddings {
  AddNewToodoModel({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();

  void saveAndReturn(context) {
    if (titleController.text.isNotEmpty || subtitleController.text.isNotEmpty) {
      String title = titleController.text;
      String subtitle = subtitleController.text;
      bool isChecked = false;
      int id = Provider.of<ToodoData>(context, listen: false).getNewToodoId();
      ToodoTodo toodo = ToodoTodo(title, subtitle, isChecked, id);
      Provider.of<ToodoData>(context, listen: false).addNewToodo(toodo);
      Provider.of<PageViewState>(context, listen: false).navigateToToodoPage();
      titleController.clear();
      subtitleController.clear();
    }
  }
}
