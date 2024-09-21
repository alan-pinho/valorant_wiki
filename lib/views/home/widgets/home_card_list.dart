import 'package:flutter/material.dart';
import 'package:valowiki/views/home/widgets/home_card.dart';

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
          label: 'PAcote',
        ),
        HomeCard(
          label: 'MApas',
        ),
        HomeCard(
          label: 'RAnkins',
        ),
      ],
    );
  }
}
