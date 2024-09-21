import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:valowiki/shared/image/cached_image.dart';
import 'package:valowiki/shared/themes/vw_light_theme.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/stores/global_store.dart';

enum ImageType {
  icon,
  image,
}

class VWImage extends StatelessWidget {
  final String? path;
  final ImageType type;
  const VWImage._({
    this.path,
    required this.type,
  });

  factory VWImage.icon(final String? path) => VWImage._(
        path: path,
        type: ImageType.icon,
      );
  factory VWImage.image(final String? path) => VWImage._(
        path: path,
        type: ImageType.image,
      );

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<GlobalStore>();
    Widget image() {
      if (path == null) {
        return const _Error();
      }
      if (path!.startsWith('http')) {
        return const CachedImage();
      }
      final assetPath = switch (type) {
        ImageType.icon => 'assets/icons/',
        ImageType.image => 'assets/images/${store.assetLocale}/'
      };
      return Image.asset(
        '$assetPath${path!}.png',
        fit: BoxFit.fill,
      );
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
