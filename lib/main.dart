import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:valowiki/configs/firebase/crashlytics/vw_crashlytics_service.dart';
import 'package:valowiki/configs/themes/theme.dart';
import 'package:valowiki/dependencies_injection.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/pages/splash/splash_page.dart';
import 'package:valowiki/routes.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
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

    WidgetsFlutterBinding.ensureInitialized();

    Intl.defaultLocale = 'pt_BR';

    await initDependenciesInjection();
    final env = GetIt.I.get<EnvironmentConfig>();
    await Firebase.initializeApp(options: env.firebaseOptions);

    FlutterError.onError = (errorDetails) {
      Logger('FlutterError').severe(
        errorDetails.exception,
        errorDetails,
        errorDetails.stack,
      );
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      Logger('PlatformDispatcher').severe(error.toString(), error, stack);
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
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context),
        );
      },
      home: const SplashPage(),
    );
  }
}
