import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/product/widgets/toodo_todo_tile_widget.dart';

//TODO:

class ShowToodoView extends StatefulWidget with Paddings {
  ShowToodoView({super.key, required this.index});

  final int index;

  @override
  State<ShowToodoView> createState() => _ShowToodoViewState();
}

class _ShowToodoViewState extends State<ShowToodoView> with Paddings {
  void onDeleted() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Toodo toodo = Provider.of<ToodoData>(context, listen: false)
        .getToodoByIndex(widget.index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(toodo.title),
      ),
      body: Padding(
        padding: bodyPadding,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Theme.of(context).colorScheme.background,
                width: double.infinity,
                child: Text(
                  toodo.subtitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: toodo.todos.length,
                itemBuilder: (context, index) => Padding(
                  padding: toodoTilePadding,
                  child: ToodoTodoTileWidget(
                    toodoTodo: toodo.todos[index],
                    onDeleted: onDeleted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
