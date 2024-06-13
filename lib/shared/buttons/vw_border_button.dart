import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:valowiki/shared/vw_ink_well.dart';

class VwBorderButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  final Color? backgrounColor;
  const VwBorderButton({
    super.key,
    this.label,
    this.onPressed,
    this.backgrounColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = backgrounColor ?? Theme.of(context).colorScheme.surface;
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: DashedBorder.all(
          color: Theme.of(context).colorScheme.onSurface,
          dashLength: 24,
          width: 1,
          isOnlyCorner: true,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: VWInkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: 240,
          margin: const EdgeInsets.all(1),
          child: Center(
            child: Text(
              label ?? '',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color.computeLuminance() > 0.5
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
