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
    appBarTheme: const AppBarTheme(
      color: primary,
      centerTitle: true,
    ));
