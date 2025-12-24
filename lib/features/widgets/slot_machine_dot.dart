import 'package:flutter/material.dart';

class SlotDotsBorder extends StatelessWidget {
  const SlotDotsBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: CustomPaint(painter: DotsPainter()));
  }
}

class DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xffFFD700);
    const dotRadius = 5.0;
    const spacing = 40.0;

    // top & bottom
    for (double x = 12; x < size.width - 12; x += spacing) {
      canvas.drawCircle(Offset(x, 14), dotRadius, paint);
      canvas.drawCircle(Offset(x, size.height - 14), dotRadius, paint);
    }

    // left & right
    for (double y = 4; y < size.height - 4; y += spacing) {
      canvas.drawCircle(Offset(14, y), dotRadius, paint);
      canvas.drawCircle(Offset(size.width - 14, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
