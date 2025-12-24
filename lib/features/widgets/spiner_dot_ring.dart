import 'dart:math';

import 'package:flutter/widgets.dart';

class SpinnerDotsRing extends StatelessWidget {
  final int dotsCount;
  final double radius;
  final double dotSize;

  const SpinnerDotsRing({
    super.key,
    this.dotsCount = 16,
    this.radius = 165,
    this.dotSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(dotsCount, (index) {
          final angle = (2 * pi / dotsCount) * index;

          return Transform.rotate(
            angle: angle,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: dotSize,
                width: dotSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFD700), // 🔥 Yellow dot
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
