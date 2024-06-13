import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/buttons/vw_linked_button.dart';
import 'package:valowiki/shared/footer/vw_splash_footer.dart';
import 'package:valowiki/shared/vw_app_bar.dart';
import 'package:valowiki/shared/vw_spacer.dart';

class AboutView extends StatelessWidget {
  static const String routeName = '/about';
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWAppBar(
        pageName: AppLocale.aboutPageName.getString(context),
      ),
      body: const _Body(),
      bottomSheet: const VWSplashFooter(heightFactor: .07),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.aboutPageContent.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const VWSpacerVertical(2),
          VWLinkedButton(
            label: AppLocale.aboutValorantLabel.getString(context),
            link: 'https://playvalorant.com/',
          ),
          const VWLinkedButton(
            label: 'Flutter',
            link: 'https://docs.flutter.dev/',
          ),
          const VWLinkedButton(
            label: 'API',
            link: 'https://dash.valorant-api.com/about',
          ),
        ],
      ),
    );
  }
}
