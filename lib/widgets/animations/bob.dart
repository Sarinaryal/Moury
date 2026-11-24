import 'dart:math';
import 'package:flutter/material.dart';

class Bob extends StatefulWidget {
  final Widget child;
  final double dy;
  final int ms;
  const Bob({super.key, required this.child, this.dy = 6, this.ms = 2600});

  @override
  State<Bob> createState() => _BobState();
}

class _BobState extends State<Bob> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: widget.ms),
  )..repeat(reverse: true);

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: c,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, -widget.dy * sin(c.value * pi)),
        child: child,
      ),
      child: widget.child,
    );
  }
}