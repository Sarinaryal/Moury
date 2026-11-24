import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../animations/press_effect.dart';

class BeeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String variant;
  final IconData? icon;
  const BeeButton(
    this.label, {
    super.key,
    required this.onTap,
    this.variant = 'honey',
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    late Color bg, fg;
    Gradient? grad;
    switch (variant) {
      case 'primary':
        bg = beeDark;
        fg = honey;
        break;
      case 'ghost':
        bg = beeDark.withOpacity(0.08);
        fg = beeDark;
        break;
      default:
        grad = const LinearGradient(colors: [honey, honeyDeep]);
        bg = honey;
        fg = beeDark;
    }
    return PressEffect(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: grad == null ? bg : null,
          gradient: grad,
          borderRadius: BorderRadius.circular(16),
          boxShadow: variant == 'ghost'
              ? null
              : [BoxShadow(color: bg.withOpacity(0.4), blurRadius: 14, offset: const Offset(0, 8))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: fg, size: 18),
              const SizedBox(width: 8),
            ],
            Text(label, style: fred(16, w: FontWeight.w600, color: fg)),
          ],
        ),
      ),
    );
  }
}