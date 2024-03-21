import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(

    seedColor: const Color.fromARGB(255, 131, 57, 0) 
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}


class App extends StatelessWidget {

  const App({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen()
    );
  }

}