import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/buttons/vw_border_button.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/about/about_view.dart';
import 'package:valowiki/views/splash/widgets/footer_sign.dart';

class LandingPageView extends StatelessWidget {
  static const String routeName = '/landing_page';
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _Header(),
          _Body(),
          _BodyMessage(),
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
        Animate().custom(
          duration: const Duration(seconds: 1),
          begin: height * .1,
          end: height * .3,
          builder: (context, value, child) => Container(
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

    return Column(
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
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                  ),
            ),
            const VWSpacerHorizontal(2),
          ],
        ),
      ],
    ).animate().moveY(
          duration: const Duration(seconds: 1),
          begin: 0.0,
          end: -(yOffset * .35),
        );
  }
}

class _BodyMessage extends StatelessWidget {
  const _BodyMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          AppLocale.landingPageText.getString(context),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    ).animate().fadeIn(delay: const Duration(seconds: 1));
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
          Transform.translate(
            offset: const Offset(0, 72),
            child: VwBorderButton(
              label: AppLocale.learnAboutTheGameButton.getString(context),
              onPressed: () {},
              backgrounColor: Theme.of(context).colorScheme.primary,
            ),
          ).animate().fadeIn(delay: const Duration(seconds: 1)),
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
                _Action(),
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

class _Action extends StatelessWidget {
  const _Action();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VwBorderButton(
          label: AppLocale.aboutTheAppButton.getString(context),
          onPressed: () {
            Navigator.of(context).pushNamed(AboutView.routeName);
          },
        )
      ],
    ).animate().fadeIn(delay: const Duration(seconds: 1));
  }
}
