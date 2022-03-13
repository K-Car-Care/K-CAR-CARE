import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    this.onPageChanged,
    this.items,
  }) : super(key: key);
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final List<Widget>? items;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        aspectRatio: 14 / 8,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
      items: items,
    );
  }
}
