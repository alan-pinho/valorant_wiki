import 'package:firebase_analytics/firebase_analytics.dart';

class VWAnayticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  VWAnayticsService._() {
    _analytics.setAnalyticsCollectionEnabled(true);
  }

  static VWAnayticsService get i => VWAnayticsService._();

  void setUserId(String idCliente, {AnalyticsCallOptions? callOptions}) {
    _analytics.setUserId(id: idCliente, callOptions: callOptions);
  }

  void logEvent(String name, {Map<String, Object?>? parameters}) {
    _analytics.logEvent(name: name, parameters: parameters);
  }

  void setUserProperty(String value) {
    _analytics.setUserProperty(name: 'phoneId', value: value);
  }

  void logScreenView({String? screenClass, String? screenName}) {
    _analytics.logScreenView(screenClass: screenClass, screenName: screenClass);
  }
}
