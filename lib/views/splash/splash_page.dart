import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_loader.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/splash/widgets/footer_sign.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = 'splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _Header(),
          _Body(),
          _Footer(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'wikiHeader',
      child: Column(
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
              AutoSizeText(
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
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
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
            height: 100,
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
