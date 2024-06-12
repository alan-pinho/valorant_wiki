import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:valowiki/configs/dependencies_injections/dependencies_injection.dart';
import 'package:valowiki/configs/firebase/analytics/vw_analytics_navigator_observer.dart';
import 'package:valowiki/configs/firebase/crashlytics/vw_crashlytics_service.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/routes.dart';
import 'package:valowiki/shared/themes/theme.dart';
import 'package:valowiki/views/splash/splash_page.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Intl.defaultLocale = 'pt_BR';

    Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
    Logger.root.onRecord.listen((record) {
      log('[${record.level.name}] [${record.time}]: ${record.message}');

      if (record.error != null) {
        VWCrashlyticsService.i.recordError(
          record.error,
          stack: record.stackTrace,
        );
      }
    });

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

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      Logger('Isolate').severe(
        errorAndStacktrace.first.toString(),
        errorAndStacktrace.last,
        errorAndStacktrace.last,
      );
    }).sendPort);

    runApp(const MyApp());
  }, (error, stack) {
    Logger('runZonedGuarded').severe(error.toString(), error, stack);
  });
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
      navigatorObservers: [VWAnalyticsRouteObserver()],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context),
        );
      },
      home: const SplashPage(),
    );
  }
}
