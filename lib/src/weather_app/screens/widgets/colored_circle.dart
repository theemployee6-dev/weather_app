import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  const ColoredCircle({
    super.key,
    required this.height,
    required this.color,
    required this.width,
    required this.alignment,
  });
  final AlignmentGeometry alignment;

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
