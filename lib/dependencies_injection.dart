import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/env.dart';

final _getIt = GetIt.I;

Future<void> initDependenciesInjection() async {
  final environmentConfig = EnvironmentConfig.instance;
  GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  final FlutterLocalization localization = await initLocation();

  _getIt.registerSingleton<EnvironmentConfig>(environmentConfig);
  _getIt.registerSingleton<GlobalKey<NavigatorState>>(globalKey);
  _getIt.registerSingleton<FlutterLocalization>(localization);
}

Future<FlutterLocalization> initLocation() async {
  final FlutterLocalization localization = FlutterLocalization.instance;
  final List<MapLocale> mapLocales = [
    const MapLocale('pt', AppLocale.pt, countryCode: 'BR'),
    const MapLocale('en', AppLocale.en, countryCode: 'US'),
  ];
  await localization.init(mapLocales: mapLocales, initLanguageCode: 'pt');

  return localization;
}
