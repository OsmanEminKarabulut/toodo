import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/view/show_toodo/show_toodo_view.dart';

class ToodoTileWidget extends StatelessWidget with Paddings {
  ToodoTileWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final Toodo toodo =
        Provider.of<ToodoData>(context, listen: false).getToodoByIndex(index);
    String title = toodo.title;
    String subtitle = toodo.subtitle;
    int id = toodo.id;
    return ListTile(
      contentPadding: toodoTileContentPadding,
      visualDensity: VisualDensity.comfortable,
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
      isThreeLine: true,
      trailing: IconButton(
          onPressed: () {
            Provider.of<ToodoData>(context, listen: false).removeToodoById(id);
          },
          icon: const Icon(Icons.delete)),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShowToodoView(index: index),
        ));
      },
    );
  }
}
