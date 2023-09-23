import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:valowiki/configs/firebase/analytics/vw_analytics_service.dart';

class VWAnalyticsRouteObserver extends NavigatorObserver {
  final _analytics = VWAnayticsService.i;

  final _logger = Logger('VWAnalyticsRouteObserver');

  @override
  void didPop(Route route, Route? previousRoute) {
    _logger.finer('RouteObserver - didPop');
    super.didPop(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: route.settings.name ?? 'unnamed route',
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _logger.finer('RouteObserver - didPush');
    super.didPush(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: route.settings.name ?? 'unnamed route',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _logger.finer('RouteObserver - didRemove');
    super.didRemove(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: route.settings.name ?? 'unnamed route',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logger.finer('RouteObserver - didReplace');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    _analytics.logScreenView(
      screenClass: newRoute?.settings.runtimeType.toString() ?? 'unnamed route',
      screenName: newRoute?.settings.name ?? 'unnamed route',
    );
  }
}
