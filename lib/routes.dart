import 'package:flutter/material.dart';
import 'package:valowiki/views/splash/splash_view.dart';

Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
      SplashView.routeName: (_) => const SplashView(),
    };
