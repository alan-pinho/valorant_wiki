import 'package:dio/dio.dart';
import 'package:valowiki/core/http/dio_http_service.dart';
import 'package:valowiki/core/http/interceptors/log_interceptor.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/stores/global_store.dart';

class ValorantApiClient extends DioHttpService {
  final GlobalStore globalStore;
  final EnvironmentConfig env;

  ValorantApiClient(this.globalStore, this.env)
      : super(
          Dio(
            BaseOptions()
              ..baseUrl = env.apiLink
              ..connectTimeout = const Duration(minutes: 1, seconds: 30)
              ..queryParameters = {'language': globalStore.apiLocale},
          )
            ..transformer = BackgroundTransformer()
            ..interceptors.add(LogggerInterceptor()),
        );
}
