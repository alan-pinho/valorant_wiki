import 'package:flutter/material.dart';

ColorScheme get themeLigth => const ColorScheme.light(
      primary: primary,
      onPrimary: white,
      secondary: secondary,
      onSecondary: white,
      tertiary: tertiary,
      onTertiary: black2,
      error: error,
      onError: white,
      shadow: grey4,
      errorContainer: error3,
      onErrorContainer: white,
      surface: white,
      onSurface: black,
      secondaryContainer: grey,
      onSecondaryContainer: white,
      tertiaryContainer: tertiary,
      onTertiaryContainer: black,
    );

const Color primary = Color(0xFFFF4655);
const Color secondary = Color(0xFF0F1923);
const Color tertiary = Color(0xFFECE8E1);

const Color black = Color(0xFF000000);
const Color black2 = Color(0xFF111111);
const Color white = Color(0xFFFFFFFF);

const Color grey = Color(0xFF2A2A2A);
const Color grey2 = Color(0xFF424242);
const Color grey3 = Color(0xFF9E9E9E);
const Color grey4 = Color(0xFFBDBDBD);

const Color error = Color(0XFFD32F2F);
const Color error2 = Color(0xFFF44336);
const Color error3 = Color(0xFFEF5350);

const Color success = Color(0xFF388E3C);
const Color success2 = Color(0xFF4CAF50);
const Color success3 = Color(0xFF66BB6A);

const Color yellowishOrange = Color(0xFFECE8E1);

const Color transparent = Colors.transparent;
