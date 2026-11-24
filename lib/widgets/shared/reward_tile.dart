import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/reward.dart';
import '../animations/confetti.dart';
import '../common/app_card.dart';
import '../common/bee_toast.dart';
import '../animations/press_effect.dart';

class RewardTile extends StatefulWidget {
  final Reward reward;
  final Color accent;
  const RewardTile({super.key, required this.reward, required this.accent});

  @override
  State<RewardTile> createState() => _RewardTileState();
}

class _RewardTileState extends State<RewardTile> {
  @override
  Widget build(BuildContext context) {
    final r = widget.reward;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: cream2,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(child: Text(r.icon, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.title, style: fred(15, w: FontWeight.w600)),
                  Text(r.sub, style: nun(12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('🎯 ${r.cost}', style: fred(13, w: FontWeight.w700, color: amber)),
                const SizedBox(height: 6),
                PressEffect(
                  onTap: () {
                    if (r.locked || r.redeemed) return;
                    setState(() => r.redeemed = true);
                    showConfetti(context);
                    showBeeToast(context, '🎁 Redeemed: ${r.title}!');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: r.locked ? cream2 : (r.redeemed ? good : widget.accent),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      r.locked ? 'Locked' : (r.redeemed ? '✓ Done' : 'Redeem'),
                      style: fred(13, w: FontWeight.w600, color: r.locked ? const Color(0xFFBBAA99) : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}