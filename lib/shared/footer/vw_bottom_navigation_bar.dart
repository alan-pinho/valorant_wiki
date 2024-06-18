import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:valowiki/configs/app_locale.dart';
import 'package:valowiki/shared/vw_ink_well.dart';

class VWBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const VWBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return _VWBottomNavigationBar(
      selectedIndex: currentIndex,
      onSelected: (value) {
        if (currentIndex == value) return;
        //TODO adicionar ações apara a bottom navigation bar
        switch (value) {
          case == 0:
            break;
          case == 1:
            break;
          case == 2:
            break;
          default:
        }
      },
      icons: [
        VWNavigationBarIcon(
          label: AppLocale.bottomNavigationBarNews.getString(context),
          icon: Icon(
            currentIndex == 0 ? Icons.description : Icons.description_outlined,
          ),
        ),
        VWNavigationBarIcon(
          label: AppLocale.bottomNavigationBarHome.getString(context),
          icon: Icon(
            currentIndex == 1 ? Icons.home : Icons.home_outlined,
          ),
        ),
        VWNavigationBarIcon(
          label: AppLocale.bottomNavigationBarWishlist.getString(context),
          icon: Icon(
            currentIndex == 2 ? Icons.favorite : Icons.favorite_border,
          ),
        ),
      ],
    );
  }
}

class _VWBottomNavigationBar extends StatefulWidget {
  final List<VWNavigationBarIcon> icons;
  final Function(int index) onSelected;
  final int selectedIndex;

  const _VWBottomNavigationBar({
    required this.icons,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  State<_VWBottomNavigationBar> createState() => _VWBottomNavigationBarState();
}

class _VWBottomNavigationBarState extends State<_VWBottomNavigationBar> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      height: kBottomNavigationBarHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < widget.icons.length; i++) ...{
            VWInkWell(
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
                widget.onSelected(selectedIndex);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / widget.icons.length,
                child: widget.icons[i],
              ),
            ),
          }
        ],
      ),
    );
  }
}

class VWNavigationBarIcon extends StatelessWidget {
  final String label;
  final Widget icon;
  const VWNavigationBarIcon({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme.merge(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          child: icon,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ],
    );
  }
}
