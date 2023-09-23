import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/configs/firebase/firebase_options_local.dart';
import 'package:valowiki/configs/firebase/firebase_options_prod.dart';

class EnvironmentConfig {
  late final String apiLink;
  late final Flavor flavor;
  late final FirebaseOptions firebaseOptions;
  final PackageInfo packageInfo;

  EnvironmentConfig(this.packageInfo) {
    init();
  }

  void init() {
    if (packageInfo.packageName.contains('local')) {
      flavor = Flavor.local;
    } else {
      flavor = Flavor.prod;
    }

    switch (flavor) {
      case Flavor.local:
        apiLink = 'https://dash.valorant-api.com/';
        firebaseOptions = DefaultFirebaseOptionsLocal.currentPlatform;
        break;

      case Flavor.prod:
        apiLink = 'https://dash.valorant-api.com/';
        firebaseOptions = DefaultFirebaseOptionsProd.currentPlatform;
        break;
    }
  }
}

enum Flavor { local, prod }
