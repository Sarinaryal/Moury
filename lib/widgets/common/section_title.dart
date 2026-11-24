import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Widget? trailing;
  
  const SectionTitle(
    this.text, {
    super.key,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 4),
      child: Row(
        children: [
          Text(
            text,
            style: fred(18, w: FontWeight.w600),
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}