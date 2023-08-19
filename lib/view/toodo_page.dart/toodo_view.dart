import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/paddings.dart';
import 'package:toodo/product/widgets/toodo_tile_widget.dart';

class ToodoView extends StatefulWidget {
  const ToodoView({super.key});

  @override
  State<ToodoView> createState() => _ToodoViewState();
}

class _ToodoViewState extends State<ToodoView> with Paddings {
  late final List<ToodoTodo> toodos;

  @override
  void initState() {
    super.initState();

    Provider.of<ToodoData>(context, listen: false).loadToodos();
    toodos = Provider.of<ToodoData>(context, listen: false).toodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          "Let's Toodo",
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
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset("assets/lottie/bounce_animation.json"),
                  Text(
                    "Hey, hadi Toodo ekle!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 20),
                  ),
                ],
              ),
            )
          : Padding(
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
            ),
    );
  }
}
