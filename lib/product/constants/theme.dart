import 'package:flutter/material.dart';

mixin MainTheme {
  ThemeData mainTheme(context) {
    return ThemeData(
        fontFamily: "Roboto",
        textTheme: const TextTheme(
            headlineSmall: TextStyle(fontSize: 30, fontFamily: "Roboto")),
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
            surface: Colors.blueGrey,
            onSurface: Colors.white),
        scaffoldBackgroundColor: Colors.blueGrey[900],
        appBarTheme: AppBarTheme(
            titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary, fontSize: 30),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 80));
  }
}
