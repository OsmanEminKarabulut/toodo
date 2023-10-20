import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:toodo/model/pageview_state.dart';
import 'package:toodo/model/toodo_data.dart';
import 'package:toodo/product/constants/theme.dart';
import 'package:toodo/view/add_new_toodo/add_new_toodo_view.dart';
import 'package:toodo/view/toodo_page.dart/toodo_view.dart';

Future<void> main() async {
  //Hive başlatıldı
  await Hive.initFlutter();

  //toodoBox adlı kutu Hive'de açıldı
  await Hive.openBox("toodoBox");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget with MainTheme {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                PageViewState()), //Sayfa geçişlerini kontrol etmek için provider state.
        ChangeNotifierProvider(create: (context) => ToodoData()), //ToodoData
      ],
      builder: (context, child) => MaterialApp(
        theme: mainTheme(context),
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
