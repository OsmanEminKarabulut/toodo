import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/product/constants/strings.dart';
import 'package:toodo/view/add_new_toodo/new_to_do/new_to_do_state.dart';

class NewTodoWidget extends StatelessWidget with Paddings, Strings {
  NewTodoWidget(
      {super.key,
      required this.titleController,
      required this.subtitleController});

  final TextEditingController titleController;
  final TextEditingController subtitleController;

  bool getIsVisible(context) {
    return Provider.of<NewTodoWidgetState>(context).isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: newToDoAddPadding,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: bodyPadding,
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  cursorColor: Colors.white,
                  style: _titleFieldStyle(),
                  decoration: _titleFieldDecoration(),
                ),
                TextField(
                  controller: subtitleController,
                  cursorColor: Colors.white,
                  style: _subtitleFieldStyle(),
                  decoration: subtitleFieldDecoration(),
                ),
              ],
            ),
          ),
        ),
      ),
      visible: getIsVisible(context),
    );
  }

  InputDecoration subtitleFieldDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: newToodoSubtitle,
      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  InputDecoration _titleFieldDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: newToodoTitle,
      hintStyle: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  TextStyle _subtitleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 20);

  TextStyle _titleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 25);
}
