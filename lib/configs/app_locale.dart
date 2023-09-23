import 'package:flutter_localization/flutter_localization.dart';

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> en = {title: 'Localization'};
  static const Map<String, dynamic> pt = {title: 'Localização'};
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