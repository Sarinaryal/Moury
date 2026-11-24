import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/providers/moury_store.dart';
import '../../widgets/animations/bob.dart';
import '../../widgets/animations/confetti.dart';
import '../../widgets/animations/press_effect.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/bee_toast.dart';
import '../../widgets/common/section_title.dart';

class HoneyPage extends StatelessWidget {
  const HoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) => ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildInfoText(),
          SectionTitle('🎁 Redeem your drops'),
          _buildRewardsList(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFFD56B), honeyDeep]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const Bob(dy: 5, child: Text('🍯', style: TextStyle(fontSize: 64))),
          Text('${store.honeyDrops}', style: fred(46, w: FontWeight.w700, color: beeDark)),
          Text('Honey Drops · Moury rewards', style: fred(15, w: FontWeight.w500, color: beeDark)),
        ],
      ),
    );
  }

  Widget _buildInfoText() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Earn Honey Drops everywhere you shop on Moury. Spend them on rewards from any partner.',
        textAlign: TextAlign.center,
        style: nun(12),
      ),
    );
  }

  Widget _buildRewardsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          _rewardTile(context, '🎟️', 'Rs 100 off any partner', 'Use at checkout anywhere', 500),
          _rewardTile(context, '☕', 'Free drink voucher', 'Top partner cafés', 800),
          _rewardTile(context, '🎬', 'Movie ticket', 'QFX / Big Movies', 2000),
        ],
      ),
    );
  }

  Widget _rewardTile(BuildContext context, String icon, String title, String subtitle, int cost) {
    final affordable = store.honeyDrops >= cost;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: cream2, borderRadius: BorderRadius.circular(14)),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: fred(15, w: FontWeight.w600)),
                  Text(subtitle, style: nun(12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('🍯 $cost', style: fred(13, w: FontWeight.w700, color: amber)),
                const SizedBox(height: 6),
                PressEffect(
                  onTap: () {
                    if (!affordable) {
                      showBeeToast(context, '🍯 Not enough Honey Drops yet');
                      return;
                    }
                    if (store.redeemHoney(cost)) {
                      showConfetti(context);
                      showBeeToast(context, '🎟️ Reward unlocked! Check your wallet');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(color: affordable ? honeyDeep : cream2, borderRadius: BorderRadius.circular(12)),
                    child: Text(affordable ? 'Redeem' : 'Locked', style: fred(13, w: FontWeight.w600, color: affordable ? Colors.white : const Color(0xFFBBAA99))),
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