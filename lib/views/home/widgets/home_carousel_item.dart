import 'package:flutter/material.dart';
import 'package:valowiki/shared/image/vw_image.dart';

class HomeCarouselItem extends StatelessWidget {
  final String? asset;
  const HomeCarouselItem({
    super.key,
    this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: VWImage.image(asset),
    );
  }
}
