import 'package:flutter/material.dart';

const COLOR_prim = Colors.white;
const COLOR_accent = Colors.blueGrey;
const COLORB_accent = Colors.lightGreenAccent;

class MyThemes{
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: COLOR_prim,
      colorScheme: ColorScheme.light(),
      primaryColor: COLOR_prim,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: COLOR_prim,
      ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style:  ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(COLOR_accent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black)
      )
    ),
  );
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey,
      colorScheme: ColorScheme.dark(),
    primaryColor: Colors.blueGrey,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style:  ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(COLORB_accent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
        )
    ),
  );

}

