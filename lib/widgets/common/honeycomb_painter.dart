import 'dart:math';
import 'package:flutter/material.dart';

class HoneycombPainter extends CustomPainter {
  final Color color;
  HoneycombPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..color = color;
    const r = 18.0;
    final h = r * sqrt(3);
    for (double y = -h; y < size.height + h; y += h) {
      int row = (y / h).round();
      for (double x = -r; x < size.width + 2 * r; x += 3 * r) {
        final cx = x + (row.isEven ? 0 : 1.5 * r);
        _hex(canvas, p, Offset(cx, y), r);
      }
    }
  }

  void _hex(Canvas c, Paint p, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final a = pi / 3 * i + pi / 6;
      final pt = Offset(center.dx + r * cos(a), center.dy + r * sin(a));
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    c.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}