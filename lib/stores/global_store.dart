import 'package:flutter_localization/flutter_localization.dart';
import 'package:mobx/mobx.dart';

part 'global_store.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {
  final FlutterLocalization _localization;
  GlobalStoreBase(this._localization);

  @computed
  String get language =>
      _localization.currentLocale?.localeIdentifier ?? 'pt_BR';

  @computed
  String get assetLocale => _localization.currentLocale?.languageCode ?? 'pt';

  @computed
  String get apiLocale =>
      '${_localization.currentLocale?.languageCode ?? "pt"}-${_localization.currentLocale?.countryCode ?? "BR"}';
}
