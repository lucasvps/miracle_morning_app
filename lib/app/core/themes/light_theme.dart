import 'package:flutter/material.dart';

class AppThemeLight {
  ThemeData getTheme() {
    // Implementar temas especializados.
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff50B5BA),
        backgroundColor: Color(0xffb9d7d9),

        // Cards
        cardTheme: CardTheme(color: Colors.white),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        iconTheme: IconThemeData(color: Color(0xff0D47A1)),

        //App Bar
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20, color: Colors.white),
              headline4: TextStyle(fontSize: 30, color: Colors.white)),
        ));
  }
}

class AppThemeDark {
  ThemeData getTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff424242),
        backgroundColor: Color(0xff9E9E9E),
        cardTheme: CardTheme(color: Color(0xffE0E0E0)),

        //App Bar
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 20, color: Colors.white),
            //headline4: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ));
  }
}
