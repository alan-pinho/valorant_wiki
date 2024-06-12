import 'package:flutter/material.dart';

class VWInkWell extends StatelessWidget {
  final Widget? child;
  final Function()? onTap;

  const VWInkWell({
    super.key,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
