import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LogggerInterceptor extends LogInterceptor {
  final Logger _logger = Logger('LogggerInterceptor');

  LogggerInterceptor();

  @override
  set logPrint(void Function(Object object) logPrint) {
    _logger.fine(logPrint.toString());
    super.logPrint = logPrint;
  }
}
