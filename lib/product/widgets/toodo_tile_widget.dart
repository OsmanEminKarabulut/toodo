import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';

class ToodoTileWidget extends StatelessWidget with Paddings {
  ToodoTileWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    ToodoTodo toodoTodo =
        Provider.of<ToodoData>(context).getToodoTodoByIndex(index);
    String title = toodoTodo.title;
    String subtitle = toodoTodo.subtitle;
    bool isChecked = toodoTodo.isChecked;
    int id = toodoTodo.id;
    return ListTile(
      contentPadding: toodoTileContentPadding,
      visualDensity: VisualDensity.comfortable,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Theme.of(context).colorScheme.primary,
      leading: Checkbox(
        value: isChecked,
        onChanged: (value) {
          Provider.of<ToodoData>(context, listen: false)
              .toodoTodoChecked(toodoTodo);
        },
      ),
      title: Text(
        title,
        style: isChecked
            ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Theme.of(context).colorScheme.error,
                )
            : Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        subtitle,
        style: isChecked
            ? TextStyle(
                fontSize: 15,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).colorScheme.error,
              )
            : const TextStyle(fontSize: 15, color: Colors.grey),
      ),
      isThreeLine: true,
      trailing: IconButton(
          onPressed: () {
            Provider.of<ToodoData>(context, listen: false).removeToodoById(id);
          },
          icon: const Icon(Icons.delete)),
      onTap: () {},
    );
  }
}
