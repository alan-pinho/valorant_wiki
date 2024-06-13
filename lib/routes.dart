import 'package:flutter/material.dart';
import 'package:valowiki/views/landing_page/landing_view.dart';
import 'package:valowiki/views/splash/splash_view.dart';

Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
      SplashView.routeName: (_) => const SplashView(),
      LandingView.routeName: (_) => const LandingView(),
    };
