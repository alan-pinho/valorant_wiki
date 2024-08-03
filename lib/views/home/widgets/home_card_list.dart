import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valowiki/shared/vw_spacer.dart';

class HomeCardList extends StatelessWidget {
  const HomeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.4,
      ),
      children: const [
        HomeCard(
          label: 'Agentes',
        ),
        HomeCard(
          label: 'Armas',
        ),
        HomeCard(
          label: 'Skins',
        ),
        HomeCard(
          label: 'Pacote',
        ),
        HomeCard(
          label: 'Mapas',
        ),
        HomeCard(
          label: 'Rankins',
        ),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final String label;

  const HomeCard({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 176,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/valorant_icon.svg',
                height: 40,
              ),
              const VWSpacerHorizontal(3),
              AutoSizeText(
                label,
                style: Theme.of(context).textTheme.headlineSmall,
                maxFontSize: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
