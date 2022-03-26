import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({
    Key? key,
    required this.dotsCount,
    required this.dotPosition,
  }) : super(key: key);
  final int dotsCount;
  final double dotPosition;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: dotPosition,
      decorator: const DotsDecorator(
          activeColor:Color(0xfffaca0b),
          spacing: EdgeInsets.all(2),
          activeSize: Size(8, 8),
          size: Size(6, 6)),
    );
  }
}
