import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/view/add_new_toodo/add_new_toodo_model.dart';

class AddNewToodoView extends AddNewToodoModel {
  AddNewToodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yepyeni Bir Toodo",
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
              onPressed: () {
                saveAndReturn(context);
              },
              child: const Icon(Icons.add)),
        ],
      ),
      body: Padding(
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
    );
  }

  InputDecoration subtitleFieldDecoration() {
    return const InputDecoration(
      border: InputBorder.none,
      hintText: "Alt Baslık",
      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
    );
  }

  InputDecoration _titleFieldDecoration() {
    return const InputDecoration(
      border: InputBorder.none,
      hintText: "Baslık",
      hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
    );
  }

  TextStyle _subtitleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 20);

  TextStyle _titleFieldStyle() =>
      const TextStyle(color: Colors.white, fontSize: 25);
}
