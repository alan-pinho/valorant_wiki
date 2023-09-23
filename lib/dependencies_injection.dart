import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/env.dart';

final _getIt = GetIt.I;

Future<void> initDependenciesInjection() async {
  GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  final FlutterLocalization localization = await initLocation();
  final packageInfo = await PackageInfo.fromPlatform();
  final environmentConfig = EnvironmentConfig(packageInfo);

  _getIt.registerSingleton<EnvironmentConfig>(environmentConfig);
  _getIt.registerSingleton<GlobalKey<NavigatorState>>(globalKey);
  _getIt.registerSingleton<FlutterLocalization>(localization);
  _getIt.registerSingleton<PackageInfo>(packageInfo);
}
