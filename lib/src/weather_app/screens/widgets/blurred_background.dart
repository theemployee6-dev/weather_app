import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground(
      {super.key, required this.sigmaX, required this.sigmaY});

  final double sigmaX;
  final double sigmaY;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}
