import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/widgets/toodo_tile_widget.dart';

//Toodolar eklendiğinde liste şeklinde gösterilmesini sağlayacak widget.

class ToodoListBuilderWidget extends StatelessWidget {
  const ToodoListBuilderWidget({
    super.key,
    required this.bodyPadding,
    required this.toodoTilePadding,
  });

  final EdgeInsets bodyPadding;
  final EdgeInsets toodoTilePadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bodyPadding,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Provider.of<ToodoData>(context).toodos.length,
          itemBuilder: (context, index) => Padding(
            padding: toodoTilePadding,
            child: ToodoTileWidget(index: index),
          ),
        ),
      ),
    );
  }
}
