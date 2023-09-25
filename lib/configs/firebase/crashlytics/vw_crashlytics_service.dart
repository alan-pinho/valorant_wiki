import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class VWCrashlyticsService {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  VWCrashlyticsService._() {
    _crashlytics.setCrashlyticsCollectionEnabled(true);
  }

  static VWCrashlyticsService get i => VWCrashlyticsService._();

  void recordError(exception, {StackTrace? stack, bool fatal = false}) {
    _crashlytics.recordError(
      exception,
      stack,
      fatal: fatal,
      printDetails: false,
    );
  }

  void setUserIdentifier(String userId) {
    _crashlytics.setUserIdentifier(userId);
  }

  void recordFlutterError(FlutterErrorDetails error) {
    _crashlytics.recordFlutterError(error);
  }

  void recordFlutterFatalError(FlutterErrorDetails error) {
    _crashlytics.recordFlutterFatalError(error);
  }

  void crashlyticsLog(String message) {
    _crashlytics.log(message);
  }
}
