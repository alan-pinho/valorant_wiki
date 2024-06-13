import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/services/view_model_scope.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_loader.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/landing_page/landing_view.dart';
import 'package:valowiki/views/splash/splash_view_model.dart';
import 'package:valowiki/views/splash/widgets/footer_sign.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashView({super.key});

  void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(LandingView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelScope(
        create: (_) => SplashViewModel(
          () => navigate(context),
        ),
        builder: (context, _) => const Stack(
          children: [
            _Header(),
            _Body(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text(
            'vAlorant',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Row(
          children: [
            const Spacer(),
            Text(
              maxLines: 1,
              AppLocale.splashCenterText.getString(context),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                  ),
            ),
            const VWSpacerHorizontal(2),
          ],
        ),
        const VWSpacerVertical(4),
        const VWLoader()
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * .1,
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Theme.of(context).cardTheme.color,
            child: Transform.flip(
              flipX: true,
              child: TriangleShape(
                size: 56,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Transform.flip(
              flipX: true,
              child: TriangleShape(
                color: Theme.of(context).cardTheme.surfaceTintColor,
              ),
            ),
          ),
          Container(
            height: height * .11,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.surfaceTintColor,
            ),
            child: const Column(
              children: [
                Spacer(),
                SplashFooterSign(),
                VWSpacerVertical(2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
