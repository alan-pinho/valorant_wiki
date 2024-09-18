import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/configs/app_locale/app_locale.dart';
import 'package:valowiki/core/http/dio_http_service.dart';
import 'package:valowiki/core/local/services/shared_preferences_service.dart';
import 'package:valowiki/env.dart';

final _getIt = GetIt.I;

Future<void> initDependenciesInjection() async {
  GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  final FlutterLocalization localization = await initLocation();
  final packageInfo = await PackageInfo.fromPlatform();
  final environmentConfig = EnvironmentConfig(packageInfo);
  final sharedPreferences = await getSharedPreferences();
  final dio = Dio();

  _getIt.registerSingleton<EnvironmentConfig>(environmentConfig);
  _getIt.registerSingleton<GlobalKey<NavigatorState>>(globalKey);
  _getIt.registerSingleton<FlutterLocalization>(localization);
  _getIt.registerSingleton<PackageInfo>(packageInfo);
  _getIt.registerSingleton<SharedPreferencesService>(sharedPreferences);
  _getIt.registerSingleton<Dio>(dio);

  //http
  _getIt.registerLazySingleton<DioHttpService>(() => DioHttpService(_getIt()));
}

Future<SharedPreferencesService> getSharedPreferences() async {
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.initPreferences();
  return sharedPreferencesService;
}
