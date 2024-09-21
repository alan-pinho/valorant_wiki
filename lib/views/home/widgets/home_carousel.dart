import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valowiki/shared/vw_spacer.dart';
import 'package:valowiki/views/home/widgets/home_carousel_item.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late CarouselSliderController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      const HomeCarouselItem(asset: 'carousel/agents'),
      const HomeCarouselItem(asset: 'carousel/arsenal'),
      const HomeCarouselItem(asset: 'carousel/maps'),
      const HomeCarouselItem(asset: 'carousel/roles'),
    ];
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            disableCenter: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
          ),
          carouselController: _controller,
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            return items[index];
          },
        ),
        const VWSpacerVertical(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < items.length; i++) ...{
              _IndexIndicator(i == _index),
            }
          ],
        )
      ],
    );
  }
}

class _IndexIndicator extends StatelessWidget {
  final bool actualIndex;
  const _IndexIndicator(this.actualIndex);

  @override
  Widget build(BuildContext context) {
    return Icon(
      actualIndex ? Icons.circle : Icons.circle_outlined,
      size: 16,
      color: actualIndex
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.secondary,
    );
  }
}
