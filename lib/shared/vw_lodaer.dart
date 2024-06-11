import 'package:flutter/material.dart';

enum LoaderSize {
  small(16),
  medium(24),
  large(32);

  final double value;

  const LoaderSize(this.value);
}

class VWLoader extends StatelessWidget {
  final LoaderSize size;

  const VWLoader({
    super.key,
    this.size = LoaderSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.value,
      width: size.value,
      child: const Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Circular progress indicator',
        ),
      ),
    );
  }
}
