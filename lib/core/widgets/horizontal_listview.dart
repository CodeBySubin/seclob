import 'package:flutter/material.dart';

class HorizontalListview extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double height;
  final int length;
  final double sepration;
  const HorizontalListview({
    super.key,
    required this.height,
    required this.length,
    required this.itemBuilder,
    required List<Map<String, dynamic>> data,
    this.sepration = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: sepration);
        },
        itemCount: length,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
