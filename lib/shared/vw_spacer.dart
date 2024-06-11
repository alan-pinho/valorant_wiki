import 'package:flutter/material.dart';

class VWSpacerVertical extends StatelessWidget {
  final double height;
  const VWSpacerVertical(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8 * height);
  }
}

class VWSpacerHorizontal extends StatelessWidget {
  final double width;
  const VWSpacerHorizontal(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 8 * width);
  }
}
