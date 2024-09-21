import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valowiki/shared/themes/vw_light_theme.dart';
import 'package:valowiki/shared/vw_loader.dart';
import 'package:valowiki/shared/vw_spacer.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  const CachedImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      placeholder: (context, url) {
        return const _Placeholder();
      },
      errorWidget: (context, url, error) {
        return const _Error();
      },
      imageUrl: imageUrl ?? '',
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return const VWLoader(
      size: LoaderSize.large,
    );
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
        const _Placeholder(),
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
