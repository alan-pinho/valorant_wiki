import 'package:flutter/material.dart';
import 'package:valowiki/pages/splash/splash_page.dart';

Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
      SplashPage.routeName: (_) => const SplashPage(),
    };
