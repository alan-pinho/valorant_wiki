import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/splash/widgets/footer_sign.dart';

class LandingView extends StatelessWidget {
  static const String routeName = '/landing_view';
  const LandingView({super.key});

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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        PlayAnimationBuilder(
          tween: Tween(begin: height * .1, end: height * .3),
          duration: const Duration(seconds: 1),
          builder: (context, value, _) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
            ),
            height: value,
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
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final yOffset = MediaQuery.of(context).size.height;

    return PlayAnimationBuilder(
      tween: Tween(begin: 0.0, end: yOffset * .35),
      duration: const Duration(seconds: 1),
      builder: (context, value, _) => Transform.translate(
        offset: Offset(0, -value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VWSpacerVertical(4),
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
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.fontFamily,
                      ),
                ),
                const VWSpacerHorizontal(2),
              ],
            ),
          ],
        ),
      ),
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
            height: height * .1,
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