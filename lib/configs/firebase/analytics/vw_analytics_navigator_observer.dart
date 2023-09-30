import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:valowiki/configs/firebase/analytics/vw_analytics_service.dart';

class VWAnalyticsRouteObserver extends NavigatorObserver {
  final _analytics = VWAnayticsService.i;

  final _logger = Logger('VWAnalyticsRouteObserver');

  @override
  void didPop(Route route, Route? previousRoute) {
    final routeName = route.settings.name ?? 'unnamed route';
    _logger.finer('RouteObserver - didPop: $routeName');
    super.didPop(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: routeName,
    );
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final routeName = route.settings.name ?? 'unnamed route';
    _logger.finer('RouteObserver - didPush: $routeName');
    super.didPush(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: routeName,
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    final routeName = route.settings.name ?? 'unnamed route';
    _logger.finer('RouteObserver - didRemove: $routeName');
    super.didRemove(route, previousRoute);

    _analytics.logScreenView(
      screenClass: route.settings.runtimeType.toString(),
      screenName: routeName,
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    final routeName = newRoute?.settings.name ?? 'unnamed route';
    _logger.finer('RouteObserver - didReplace: $routeName');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    _analytics.logScreenView(
      screenClass: newRoute?.settings.runtimeType.toString() ?? 'unnamed route',
      screenName:routeName,
    );
  }
}
