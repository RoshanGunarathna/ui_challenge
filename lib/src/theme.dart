import 'package:flutter/material.dart';

import 'constants/font_families.dart';
import 'constants/palette.dart';

class CustomTheme {
  static ThemeData primaryTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Palette.kPrimaryColor,
      scaffoldBackgroundColor: Palette.kBackgroundPrimaryColor,
      useMaterial3: true,

      //Text theme
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: kPrimaryFontFamily,
            displayColor: Palette.kFontPrimaryColor,
            bodyColor: Palette.kFontPrimaryColor,
          ),

      //AppBar theme
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: Palette.kBackgroundPrimaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Palette.kIconPrimaryColor,
        ),
        toolbarTextStyle: TextStyle(
          color: Palette.kIconPrimaryColor,
        ),
        titleTextStyle: TextStyle(
          color: Palette.kIconPrimaryColor,
        ),
      ),

      //Button styles
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Palette.kFontPrimaryColor,
          ),
        ),
      ),

      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll<Color>(Palette.kButtonPrimaryColor),
        ),
      ),
    );
  }
}
