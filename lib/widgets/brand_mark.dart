import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 28});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _MarkPainter(color: context.colors.ink)),
    );
  }
}

class _MarkPainter extends CustomPainter {
  const _MarkPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.08
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final inset = size.shortestSide * 0.08;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.shortestSide / 2 - inset,
      stroke,
    );

    final path = Path()
      ..moveTo(size.width * 0.50, size.height * 0.28)
      ..lineTo(size.width * 0.72, size.height * 0.70)
      ..lineTo(size.width * 0.28, size.height * 0.70)
      ..close();
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant _MarkPainter oldDelegate) =>
      color != oldDelegate.color;
}
