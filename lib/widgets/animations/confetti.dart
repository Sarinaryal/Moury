import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class _Particle {
  final double x, drift, size, rot;
  final Color color;
  _Particle(this.x, this.drift, this.size, this.rot, this.color);
}

class Confetti extends StatefulWidget {
  final VoidCallback onDone;
  const Confetti({super.key, required this.onDone});

  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..forward();
  final rnd = Random();
  late final List<_Particle> parts;
  static const colors = [honey, honeyDeep, beeDark, pink, good, Colors.white];

  @override
  void initState() {
    super.initState();
    parts = List.generate(
      40,
      (i) => _Particle(
        rnd.nextDouble(),
        (rnd.nextDouble() - 0.5) * 1.2,
        6 + rnd.nextDouble() * 8,
        rnd.nextDouble() * 6,
        colors[i % colors.length],
      ),
    );
    c.addStatusListener((s) {
      if (s == AnimationStatus.completed) widget.onDone();
    });
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: c,
        builder: (_, __) => CustomPaint(
          size: Size.infinite,
          painter: _ConfettiPainter(parts, c.value),
        ),
      ),
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  final List<_Particle> parts;
  final double t;
  _ConfettiPainter(this.parts, this.t);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in parts) {
      final y = t * (size.height * 0.9) - 20;
      final x = p.x * size.width + p.drift * 220 * t;
      final paint = Paint()..color = p.color.withOpacity((1 - t).clamp(0, 1));
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.rot * t * 4);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset.zero,
            width: p.size,
            height: p.size * 1.4,
          ),
          const Radius.circular(2),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) => old.t != t;
}

void showConfetti(BuildContext context) {
  final overlay = Overlay.of(context, rootOverlay: true);
  late OverlayEntry entry;
  entry = OverlayEntry(builder: (_) => Confetti(onDone: () => entry.remove()));
  overlay.insert(entry);
}