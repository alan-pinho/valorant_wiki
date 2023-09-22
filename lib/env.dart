class EnvironmentConfig {
  late final String apiLink;

  static EnvironmentConfig get instance => EnvironmentConfig._init();

  EnvironmentConfig._init() {
    apiLink = 'https://dash.valorant-api.com/';
  }
}
