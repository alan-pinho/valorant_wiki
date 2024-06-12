import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/env.dart';
import 'package:valowiki/services/url_launcher_service.dart';
import 'package:valowiki/shared/vw_ink_well.dart';
import 'package:valowiki/shared/vw_spacer.dart';

class SplashFooterSign extends StatelessWidget {
  const SplashFooterSign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Signature(),
      ],
    );
  }
}

class _Signature extends StatelessWidget {
  const _Signature();

  @override
  Widget build(BuildContext context) {
    final env = GetIt.I<EnvironmentConfig>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocale.splashFooter.getString(context),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).canvasColor,
              ),
        ),
        const VWSpacerHorizontal(1),
        VWInkWell(
          onTap: () {
            UrlLauncherService.launchUrlEA(env.gitHubLink);
          },
          child: SvgPicture.asset(
            'assets/icons/github_icon.svg',
            height: 20,
            width: 20,
            colorFilter: ColorFilter.mode(
              Theme.of(context).canvasColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        const VWSpacerHorizontal(1),
        VWInkWell(
          onTap: () {
            UrlLauncherService.launchUrlEA(env.linkedinLink);
          },
          child: SvgPicture.asset(
            'assets/icons/linkedIn_icon.svg',
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
