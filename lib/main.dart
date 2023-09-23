import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:valowiki/configs/themes/theme.dart';
import 'package:valowiki/dependencies_injection.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/pages/splash/splash_page.dart';
import 'package:valowiki/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final Logger log = Logger('main');

  Intl.defaultLocale = 'pt_BR';
  await initDependenciesInjection();

  final env = GetIt.I.get<EnvironmentConfig>();

  await Firebase.initializeApp(options: env.firebaseOptions);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

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
