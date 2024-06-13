import 'package:flutter/material.dart';
import 'package:valowiki/views/about/about_view.dart';
import 'package:valowiki/views/landing_page/landing_page_view.dart';
import 'package:valowiki/views/splash/splash_view.dart';

Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
      SplashView.routeName: (_) => const SplashView(),
      LandingPageView.routeName: (_) => const LandingPageView(),
      AboutView.routeName: (_) => const AboutView(),
    };
