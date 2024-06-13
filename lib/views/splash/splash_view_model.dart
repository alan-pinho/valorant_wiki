import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:valowiki/services/view_model_scope.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase extends ViewModelBase with Store {
  final Function() navigate;

  SplashViewModelBase(this.navigate) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => navigate(),
    );
  }
}
