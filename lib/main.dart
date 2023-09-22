import 'package:flutter/material.dart';
import 'package:valowiki/configs/themes/theme.dart';
import 'package:valowiki/pages/splash/splash_page.dart';
import 'package:valowiki/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValoWiki',
      routes: routes,
      theme: theme,
      initialRoute: SplashPage.routeName,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context),
        );
      },
      home: const SplashPage(),
    );
  }
}
