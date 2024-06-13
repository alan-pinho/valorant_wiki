import 'package:flutter_localization/flutter_localization.dart';

mixin AppLocale {
  static const String title = 'title';
  static const String splashCenterText = 'splashCenterText';
  static const String splashFooter = 'splashFooter';
  static const String landingPageText = 'landingPageText';

  static const Map<String, dynamic> en = {
    title: 'Localization',
    splashCenterText: 'A Flutter Wiki APP',
    splashFooter: 'Made by Alan Pinho',
    landingPageText:
        'Valorant is a free-to-play tactical first-person shooter game developed and published by Riot Games.',
  };
  static const Map<String, dynamic> pt = {
    title: 'Localização',
    splashCenterText: 'Um aplicativo Flutter de Wiki',
    splashFooter: 'Produzido por Alan Pinho',
    landingPageText:
        'Valorant é um jogo de tiro tático em primeira pessoa grátis para jogar, sendo desenvolvido e publicado pela a Riot Games.',
  };
}
Future<FlutterLocalization> initLocation() async {
  final FlutterLocalization localization = FlutterLocalization.instance;
  final List<MapLocale> mapLocales = [
    const MapLocale('pt', AppLocale.pt, countryCode: 'BR'),
    const MapLocale('en', AppLocale.en, countryCode: 'US'),
  ];
  await localization.init(mapLocales: mapLocales, initLanguageCode: 'pt');

  return localization;
}
