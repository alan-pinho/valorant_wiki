import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:valowiki/dependencies_injection.dart';
import 'package:valowiki/pages/splash/splash_page.dart';
import 'package:valowiki/routes.dart';
import 'package:valowiki/configs/themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  await initDependenciesInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = GetIt.I.get<GlobalKey<NavigatorState>>();
    final localization = GetIt.I.get<FlutterLocalization>();

    return MaterialApp(
      title: 'ValoWiki',
      navigatorKey: globalKey,
      routes: routes,
      theme: theme,
      locale: localization.currentLocale,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
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
