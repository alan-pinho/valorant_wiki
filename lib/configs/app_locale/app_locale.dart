import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale/en_us/en_app_locale.dart';
import 'package:valowiki/configs/app_locale/pt_br/pt_app_locale.dart';

mixin AppLocale {
  static const String title = 'title';
  static const String splashCenterText = 'splashCenterText';
  static const String splashFooter = 'splashFooter';
  static const String landingPageText = 'landingPageText';
  static const String learnAboutTheGameButton = 'landingbutton1';
  static const String aboutTheAppButton = 'landingbutton2';
  static const String aboutPageName = 'aboutPageName';
  static const String aboutPageContent = 'aboutPageContent';
  static const String aboutValorantLabel = 'aboutValorantLabel';
  static const String homeAppBar = 'homeAppBar';
  static const String bottomNavigationBarNews = 'bottomNavigationBarNews';
  static const String bottomNavigationBarHome = 'bottomNavigationBarHome';
  static const String bottomNavigationBarWishlist =
      'bottomNavigationBarWishlist';
}
Future<FlutterLocalization> initLocation() async {
  final FlutterLocalization localization = FlutterLocalization.instance;
  final List<MapLocale> mapLocales = [
    MapLocale('pt', PtAppLocale().pt, countryCode: 'BR'),
    MapLocale('en', EnAppLocale().en, countryCode: 'US'),
  ];
  await localization.init(mapLocales: mapLocales, initLanguageCode: 'pt');

  return localization;
}
