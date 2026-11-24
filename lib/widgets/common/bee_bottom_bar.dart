import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';

class BarItem {
  final String icon, label;
  const BarItem(this.icon, this.label);
}

class BeeBottomBar extends StatefulWidget {
  final int current;
  final List<BarItem> items;
  final ValueChanged<int> onTap;
  final String fabIcon;
  final VoidCallback onFab;
  const BeeBottomBar({
    super.key,
    required this.current,
    required this.items,
    required this.onTap,
    required this.fabIcon,
    required this.onFab,
  });

  @override
  State<BeeBottomBar> createState() => _BeeBottomBarState();
}

class _BeeBottomBarState extends State<BeeBottomBar> with SingleTickerProviderStateMixin {
  late final AnimationController pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    pulse.dispose();
    super.dispose();
  }

  Widget _tab(int i) {
    final it = widget.items[i];
    final on = widget.current == i;
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(i),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: on ? 1.18 : 1,
              duration: const Duration(milliseconds: 220),
              child: Text(it.icon, style: const TextStyle(fontSize: 22)),
            ),
            const SizedBox(height: 2),
            Text(
              it.label,
              style: fred(10, w: FontWeight.w600, color: on ? amber : beeSoft),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 86,
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: beeDark.withOpacity(0.12),
              blurRadius: 24,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: Row(
          children: [
            _tab(0),
            _tab(1),
            SizedBox(
              width: 70,
              child: Center(
                child: GestureDetector(
                  onTap: widget.onFab,
                  child: ScaleTransition(
                    scale: Tween(begin: 1.0, end: 1.06).animate(pulse),
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [honey, honeyDeep]),
                        shape: BoxShape.circle,
                        border: Border.all(color: white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: honeyDeep.withOpacity(0.6),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(widget.fabIcon, style: const TextStyle(fontSize: 24)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _tab(2),
            _tab(3),
          ],
        ),
      ),
    );
  }
}