import 'package:flutter/material.dart';
import 'package:valowiki/shared/shapes/triangle.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/splash/widgets/footer_sign.dart';

class VWSplashFooter extends StatelessWidget {
  final double heightFactor;
  const VWSplashFooter({
    super.key,
    this.heightFactor = .11,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TriangleShape(
                  color: Theme.of(context).cardTheme.surfaceTintColor,
                ),
              ),
              Container(
                height: height * heightFactor,
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
        ),
      ],
    );
  }
}
