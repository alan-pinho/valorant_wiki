import 'package:flutter/material.dart';
import 'package:valowiki/shared/image/cached_image.dart';
import 'package:valowiki/shared/themes/vw_light_theme.dart';
import 'package:valowiki/shared/vw_spacer.dart';

class VWImage extends StatelessWidget {
  final String? path;
  const VWImage({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    Widget image() {
      if (path == null) {
        return const _Error();
      }
      if (path!.startsWith('http')) {
        return const CachedImage();
      }
      if (path!.startsWith('assets')) {
        return Image.asset(path!);
      }
      return const SizedBox.shrink();
    }

    return image();
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VWSpacerVertical(2),
        Text(
          'Não foi possível carregar a imagem!',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: grey2,
              ),
        )
      ],
    );
  }
}
