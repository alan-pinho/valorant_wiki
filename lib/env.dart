import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:valowiki/configs/firebase/firebase_options_local.dart';
import 'package:valowiki/configs/firebase/firebase_options_prod.dart';

class EnvironmentConfig {
  late final String apiLink;
  late final String gitHubLink;
  late final String linkedinLink;
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

    apiLink = 'https://dash.valorant-api.com/';
    gitHubLink = 'https://github.com/alan-pinho/';
    linkedinLink = 'https://www.linkedin.com/in/alan-pinho/';

    switch (flavor) {
      case Flavor.local:
        firebaseOptions = DefaultFirebaseOptionsLocal.currentPlatform;
        break;

      case Flavor.prod:
        firebaseOptions = DefaultFirebaseOptionsProd.currentPlatform;
        break;
    }
  }
}

enum Flavor { local, prod }
