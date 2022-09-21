import 'package:flutter/material.dart';

class KingsbetUI {
  KingsbetUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFFA40734),
    primaryColorDark: const Color(0xFF360411),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFA40734),
    ),
    fontFamily: "Uncial Antiqua",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA40734),
        textStyle: const TextStyle(
          fontFamily: 'Uncial Antiqua',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const textBold = TextStyle(fontWeight: FontWeight.bold);
}
