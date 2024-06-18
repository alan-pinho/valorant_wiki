import 'package:flutter/material.dart';
import 'package:valowiki/shared/themes/vw_light_theme.dart';
import 'package:valowiki/shared/themes/vw_text_theme.dart';

ThemeData get theme => ThemeData(
    colorScheme: themeLigth,
    useMaterial3: true,
    textTheme: textTheme,
    cardTheme: const CardTheme(
      color: yellowishOrange,
      surfaceTintColor: grey,
    ),
    appBarTheme: AppBarTheme(
      color: themeLigth.primary,
      centerTitle: true,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: themeLigth.secondaryContainer,
      surfaceTintColor: Colors.transparent,
      indicatorColor: themeLigth.secondaryContainer,
      iconTheme: WidgetStatePropertyAll(IconThemeData(
        color: themeLigth.onSecondaryContainer,
      )),
      labelTextStyle: WidgetStatePropertyAll(
        textTheme.bodySmall?.copyWith(color: themeLigth.onSecondaryContainer),
      ),
      overlayColor: WidgetStatePropertyAll(themeLigth.secondaryContainer),
    ));
