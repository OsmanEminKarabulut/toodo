import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/view/add_new_toodo/add_new_toodo_view.dart';
import 'package:toodo/view/toodo_page.dart/toodo_view.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox("toodoBox");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageViewState()),
        ChangeNotifierProvider(create: (context) => ToodoData()),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
            fontFamily: "Lato",
            textTheme: const TextTheme(
                headlineSmall: TextStyle(fontSize: 30, fontFamily: "Lato")),
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: Colors.blueGrey[700]!,
                onPrimary: Colors.white,
                secondary: Colors.blueGrey,
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.red,
                background: Colors.blueGrey[900]!,
                onBackground: Colors.white,
                surface: Colors.red,
                onSurface: Colors.white),
            scaffoldBackgroundColor: Colors.blueGrey[900],
            appBarTheme: AppBarTheme(
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 30),
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 80)),
        home: PageView(
          controller: Provider.of<PageViewState>(context).pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ToodoView(
              key: key,
            ),
            AddNewToodoView(
              key: key,
            ),
          ],
        ),
      ),
    );
  }
}
