import 'package:flutter/material.dart';
import 'package:valowiki/routes.dart';
import 'package:valowiki/theme.dart';

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
      home: Container(),
    );
  }
}
