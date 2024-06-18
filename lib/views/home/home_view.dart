import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/footer/vw_bottom_navigation_bar.dart';
import 'package:valowiki/shared/vw_app_bar.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWAppBar(
        pageName: AppLocale.homeAppBar.getString(context),
      ),
      bottomNavigationBar: const VWBottomNavigationBar(currentIndex: 1),
    );
  }
}
