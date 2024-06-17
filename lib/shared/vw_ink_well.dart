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
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
