import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int currentIndex;
  final int pageLength;
  final Color activeColor;
  final Color color;
  final Size activeSize;
  final Size size;
  final EdgeInsets spacing;
  const Indicator({
    super.key,
    required this.currentIndex,
    required this.pageLength,
    required this.activeColor,
    required this.color,
    required this.activeSize,
    required this.size,
    EdgeInsets? spacing,
  }) : spacing = spacing ?? const EdgeInsets.all(6.0);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      animate: true,
      position: double.parse(currentIndex.toString()),
      decorator: DotsDecorator(
        activeColor: activeColor,
        color: color,
        activeSize: activeSize,
        size: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        spacing: spacing,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsCount: pageLength,
    );
  }
}
