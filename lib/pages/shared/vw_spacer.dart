import 'package:flutter/material.dart';

class VWSpacerVertical extends StatelessWidget {
  final int height;
  const VWSpacerVertical(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 4 * height.toDouble());
  }
}

class VWSpacerHorizontal extends StatelessWidget {
  final int width;
  const VWSpacerHorizontal(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 4 * width.toDouble());
  }
}
