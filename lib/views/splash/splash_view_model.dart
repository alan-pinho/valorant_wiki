import 'package:mobx/mobx.dart';
import 'package:valowiki/services/shared_preferences_service.dart';

part 'splash_view_model.g.dart';

enum SplashRouteNavigate {
  landingPage,
  homePage;
}

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store {
  final SharedPreferencesService _preferences;
  final Function(SplashRouteNavigate route) _navigate;

  SplashViewModelBase(
    this._preferences,
    this._navigate,
  ) {
    _getPreferences();
  }

  @observable
  bool firstView = false;

  Future<void> _getPreferences() async {
    firstView = _preferences.getFistLookValue();

    await Future.delayed(const Duration(seconds: 4));

    final route = firstView
        ? SplashRouteNavigate.landingPage
        : SplashRouteNavigate.homePage;

    _navigate(route);
  }
}
