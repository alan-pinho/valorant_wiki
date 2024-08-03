import 'package:valowiki/configs/app_locale/app_locale.dart';
import 'package:valowiki/configs/app_locale/en_us/about_locale.dart';
import 'package:valowiki/configs/app_locale/en_us/home_locale.dart';
import 'package:valowiki/configs/app_locale/en_us/landing_locale.dart';
import 'package:valowiki/configs/app_locale/en_us/splash_locale.dart';

class EnAppLocale with AppLocale {
  Map<String, dynamic> en = {
    AppLocale.title: 'Localization',
    ...SplashLocaleEn.en,
    ...LandingLocaleEn.en,
    ...AboutLocaleEn.en,
    ...HomeLocaleEn.en,
  };
}
