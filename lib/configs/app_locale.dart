import 'package:flutter_localization/flutter_localization.dart';

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

  static const Map<String, dynamic> en = {
    title: 'Localization',
    //SplashView
    splashCenterText: 'A Flutter Wiki APP',
    splashFooter: 'Made by Alan Pinho',
    //LandingPageView
    landingPageText:
        'Valorant is a free-to-play tactical first-person shooter game developed and published by Riot Games.',
    learnAboutTheGameButton: 'LEARN ABOUT THE GAME',
    //AbouteView
    aboutTheAppButton: 'ABOUT THE APP',
    aboutPageName: 'About the APP',
    aboutPageContent:
        'This app aims to present information about the game Valorant, a free-to-play tactical first-person shooter developed and published by Riot Games.\n\nThe application was created by Alan Pinho using the cross-platform development tool Flutter.',
    aboutValorantLabel: 'The game',
    //HomeView
    homeAppBar: 'Home',
  };
  static const Map<String, dynamic> pt = {
    title: 'Localização',
    //SplashView
    splashCenterText: 'Um aplicativo Flutter de Wiki',
    splashFooter: 'Produzido por Alan Pinho',
    //LandingPageView
    landingPageText:
        'Valorant é um jogo de tiro tático em primeira pessoa grátis para jogar, sendo desenvolvido e publicado pela a Riot Games.',
    learnAboutTheGameButton: 'CONHEÇA O JOGO',
    //AbouteView
    aboutTheAppButton: 'SOBRE O APP',
    aboutPageName: 'Sobre o APP',
    aboutPageContent:
        'Este App visa apresentar informações sobre Valorant, jogo de tiro tático em primeira pessoa grátis para jogar, sendo desenvolvido e publicado pela a Riot Games.\n\nAplicativo criado por Alan Pinho, utilizando a ferramenta de desenvolvimento multiplataforma Flutter.',
    aboutValorantLabel: 'O jogo',
    //HomeView
    homeAppBar: 'Início',
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
