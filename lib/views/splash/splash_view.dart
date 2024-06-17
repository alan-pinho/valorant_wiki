import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/services/view_model_scope.dart';
import 'package:valowiki/shared/footer/vw_splash_footer.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_loader.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/landing_page/landing_page_view.dart';
import 'package:valowiki/views/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashView({super.key});

  void navigate(BuildContext context, SplashRouteNavigate route) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      switch (route) {
        case SplashRouteNavigate.landingPage:
          Navigator.of(context).pushReplacementNamed(LandingPageView.routeName);
          break;
        case SplashRouteNavigate.homePage:
          //TODO adicionar homePage
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelScope(
        create: (_) => SplashViewModel(
          GetIt.I(),
          (route) => navigate(context, route),
        ),
        builder: (context, _) => const Stack(
          children: [
            _Header(),
            _Body(),
          ],
        ),
      ),
      bottomNavigationBar: const VWSplashFooter(),
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
            child: TriangleShape(
              size: 56,
              color: Theme.of(context).cardColor,
            ),
          ),
        ),
      ],
    );
  }
}
