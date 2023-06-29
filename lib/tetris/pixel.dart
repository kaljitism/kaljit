import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  final Color? color;
  final int? index;

  const Pixel({super.key, this.color, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
