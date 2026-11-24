import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';

class ModeToggle extends StatelessWidget {
  final String mode;
  final ValueChanged<String> onChanged;
  const ModeToggle({super.key, required this.mode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Widget seg(String id, String label) {
      final on = mode == id;
      return GestureDetector(
        onTap: () => onChanged(id),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: on ? honey : Colors.transparent,
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(label, style: fred(13, w: FontWeight.w600, color: on ? beeDark : cream2)),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          seg('customer', '👤 Customer'),
          seg('business', '🏪 Business'),
        ],
      ),
    );
  }
}