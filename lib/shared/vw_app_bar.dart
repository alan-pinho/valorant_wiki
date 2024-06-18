import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VWAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageName;

  const VWAppBar({
    super.key,
    this.pageName = '',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        pageName,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.surface),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            'assets/images/logo_small.svg',
            height: 40,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
