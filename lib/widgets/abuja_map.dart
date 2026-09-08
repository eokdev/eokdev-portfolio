import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AbujaMap extends StatelessWidget {
  const AbujaMap({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CustomPaint(
      painter: _AbujaMapPainter(
        ground: dark ? const Color(0xFF2A2926) : const Color(0xFFD8D9D4),
        street: dark ? const Color(0xFF3A3935) : const Color(0xFFB8BAB3),
        avenue: dark ? const Color(0xFF4A4944) : const Color(0xFFA8AAA3),
        park: dark ? const Color(0xFF32362E) : const Color(0xFFC5C8BF),
        ink: colors.ink,
        card: colors.card,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _AbujaMapPainter extends CustomPainter {
  const _AbujaMapPainter({
    required this.ground,
    required this.street,
    required this.avenue,
    required this.park,
    required this.ink,
    required this.card,
  });

  final Color ground;
  final Color street;
  final Color avenue;
  final Color park;
  final Color ink;
  final Color card;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = ground);

    final streetPaint = Paint()
      ..color = street
      ..strokeWidth = 1.15
      ..style = PaintingStyle.stroke;

    final avenuePaint = Paint()
      ..color = avenue
      ..strokeWidth = 2.1
      ..style = PaintingStyle.stroke;

    for (var x = 0.0; x < size.width; x += 22) {
      canvas.drawLine(Offset(x, 0), Offset(x + 8, size.height), streetPaint);
    }
    for (var y = 0.0; y < size.height; y += 18) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y + 4), streetPaint);
    }

    canvas.drawLine(
      Offset(0, size.height * 0.42),
      Offset(size.width, size.height * 0.38),
      avenuePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.32, 0),
      Offset(size.width * 0.48, size.height),
      avenuePaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.72),
      Offset(size.width, size.height * 0.66),
      avenuePaint,
    );

    final parkPaint = Paint()..color = park;
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.28), 28, parkPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width * 0.22, size.height * 0.58),
          width: 54,
          height: 36,
        ),
        const Radius.circular(8),
      ),
      parkPaint,
    );

    final pin = Offset(size.width * 0.52, size.height * 0.46);
    canvas.drawCircle(pin, 7, Paint()..color = ink);
    canvas.drawCircle(pin, 3.2, Paint()..color = card);

    final halo = Paint()
      ..color = ink.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(pin, 16, halo);
  }

  @override
  bool shouldRepaint(covariant _AbujaMapPainter oldDelegate) {
    return ground != oldDelegate.ground ||
        street != oldDelegate.street ||
        avenue != oldDelegate.avenue ||
        park != oldDelegate.park ||
        ink != oldDelegate.ink ||
        card != oldDelegate.card;
  }
}

class MapCardFace extends StatelessWidget {
  const MapCardFace({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      fit: StackFit.expand,
      children: [
        const AbujaMap(),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                colors.card.withValues(alpha: 0.15),
                colors.card.withValues(alpha: 0.92),
              ],
              stops: const [0.35, 0.62, 1],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'ABUJA',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 34,
                  letterSpacing: 4.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'NIGERIA',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colors.muted,
                  letterSpacing: 2.4,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '9.0765° N  ·  7.3986° E',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
