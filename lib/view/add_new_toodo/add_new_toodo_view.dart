import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/product/widgets/toodo_todo_tile_widget.dart';
import 'package:toodo/view/add_new_toodo/add_new_toodo_model.dart';
import 'package:toodo/view/add_new_toodo/new_to_do/new_to_do_state.dart';
import 'package:toodo/view/add_new_toodo/new_to_do/new_to_do_widget.dart';

class AddNewToodoView extends StatefulWidget {
  AddNewToodoView({super.key});
  @override
  State<StatefulWidget> createState() => AddNewToodoViewState();
}

class AddNewToodoViewState extends AddNewToodoModel {
  void onDeleted() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewTodoWidgetState(),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => saveAndReturn(context), icon: Icon(Icons.done))
          ],
          title: Text(
            addNewToodoTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
                onPressed: () {
                  Provider.of<PageViewState>(context, listen: false)
                      .navigateToToodoPage();
                },
                child: const Icon(Icons.remove)),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
                onPressed: () => newTodoFunction(context),
                child: const Icon(Icons.add)),
          ],
        ),
        body: Stack(children: [
          Padding(
            padding: bodyPadding,
            child: Column(
              children: [
                toodoThingsField(),
                todos.isEmpty ? Container() : todoListBuilder(),
              ],
            ),
          ),
          NewTodoWidget(
              titleController: newTodoTitleController,
              subtitleController: newTodoSubtitleController)
        ]),
      ),
    );
  }

  Container todoListBuilder() {
    return Container(
      height: 620,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: todos.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ToodoTodoTileWidget(
            toodoTodo: todos[index],
            onDeleted: onDeleted,
          ),
        ),
      ),
    );
  }

  Container toodoThingsField() {
    return Container(
      //Toodo Things Field
      color: Colors.blueGrey[900],
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
    );
  }

  InputDecoration subtitleFieldDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: newToodoSubtitle,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
    );
  }

  InputDecoration _titleFieldDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      hintText: newToodoTitle,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
    );
  }

  TextStyle _subtitleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 20);

  TextStyle _titleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 25);
}
