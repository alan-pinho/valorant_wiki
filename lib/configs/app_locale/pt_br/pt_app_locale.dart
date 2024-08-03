import 'package:valowiki/configs/app_locale/app_locale.dart';
import 'package:valowiki/configs/app_locale/pt_br/about_locale.dart';
import 'package:valowiki/configs/app_locale/pt_br/home_locale.dart';
import 'package:valowiki/configs/app_locale/pt_br/landing_locale.dart';
import 'package:valowiki/configs/app_locale/pt_br/splash_locale.dart';

class PtAppLocale with AppLocale {
  Map<String, dynamic> pt = {
    AppLocale.title: 'Localização',
    ...SplashLocalePt.pt,
    ...LandingLocalePt.pt,
    ...AboutLocalePt.pt,
    ...HomeLocalePt.pt,
  };
}
