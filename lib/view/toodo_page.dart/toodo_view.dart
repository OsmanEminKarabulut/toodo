import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/product/constants/strings.dart';
import 'package:toodo/view/toodo_page.dart/widgets/empty_page_widget.dart';
import 'package:toodo/view/toodo_page.dart/widgets/toodo_list_builder_widget.dart';

class ToodoView extends StatefulWidget {
  const ToodoView({super.key});

  @override
  State<ToodoView> createState() => _ToodoViewState();
}

class _ToodoViewState extends State<ToodoView> with Paddings, Strings {
  late final List<Toodo> toodos;

  @override
  void initState() {
    super.initState();

    Provider.of<ToodoData>(context, listen: false).toodoInitState();
    toodos = Provider.of<ToodoData>(context, listen: false).toodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          toodoTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<PageViewState>(context, listen: false)
                .navigateToAddNewTodoPage();
          },
          child: const Icon(Icons.add)),
      body: toodos.isEmpty
          ? EmptyPageWidget(toodoBodyText: toodoBodyText)
          : ToodoListBuilderWidget(
              bodyPadding: bodyPadding, toodoTilePadding: toodoTilePadding),
    );
  }
}
