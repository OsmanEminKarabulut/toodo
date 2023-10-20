import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';

class ToodoTodoTileWidget extends StatefulWidget with Paddings {
  ToodoTodoTileWidget(
      {super.key, required this.toodoTodo, required this.onDeleted});

  final ToodoTodo toodoTodo;
  final VoidCallback onDeleted;

  @override
  State<ToodoTodoTileWidget> createState() => _ToodoTodoTileWidgetState();
}

class _ToodoTodoTileWidgetState extends State<ToodoTodoTileWidget>
    with Paddings {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: toodoTileContentPadding,
      visualDensity: VisualDensity.comfortable,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Theme.of(context).colorScheme.primary,
      leading: Checkbox(
        value: widget.toodoTodo.isChecked,
        onChanged: (value) {
          setState(() {
            Provider.of<ToodoData>(context, listen: false).toodoTodoChecked(
                widget.toodoTodo.id, widget.toodoTodo.toodoId);
          });
        },
      ),
      title: Text(
        widget.toodoTodo.title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        widget.toodoTodo.subtitle,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
      isThreeLine: true,
      trailing: IconButton(
          onPressed: () {
            widget.onDeleted();
            Provider.of<ToodoData>(context, listen: false).removeToodoTodoById(
                widget.toodoTodo.id, widget.toodoTodo.toodoId);
          },
          icon: const Icon(Icons.delete)),
      onTap: () {},
    );
  }
}
