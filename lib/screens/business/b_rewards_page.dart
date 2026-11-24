import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/common/app_card.dart';
import '../../../widgets/common/bee_button.dart';

class BRewardsPage extends StatelessWidget {
  const BRewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeader(),
        _buildLoyaltyTypeCard(),
        _buildRewardsSection(),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [beeDark, beeSoft]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Text('🎁 Your rewards', style: fred(22, w: FontWeight.w700, color: honey)),
    );
  }

  Widget _buildLoyaltyTypeCard() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Loyalty type', style: fred(15, w: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: BeeButton('🎯 Points', onTap: () {})),
                const SizedBox(width: 10),
                Expanded(child: BeeButton('⭕ Punch card', variant: 'ghost', onTap: () {})),
              ],
            ),
            const SizedBox(height: 10),
            Text('Customers earn points per Rs spent, or collect punches per visit.', style: nun(12)),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(22, 0, 22, 10), child: Text('Reward menu', style: fred(15, w: FontWeight.w600))),
        _rewardToggle('☕', 'Free coffee', 'After 10 punches', true),
        _rewardToggle('🧁', 'Free muffin', '300 points', true),
        _rewardToggle('🎂', 'Birthday treat', 'Auto every year', false),
      ],
    );
  }

  Widget _rewardToggle(String icon, String title, String subtitle, bool initial) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 10),
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
            _MiniToggle(initial: initial),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: BeeButton('➕ Add reward', variant: 'primary', onTap: () {}),
    );
  }
}

class _MiniToggle extends StatefulWidget {
  final bool initial;
  const _MiniToggle({required this.initial});

  @override
  State<_MiniToggle> createState() => _MiniToggleState();
}

class _MiniToggleState extends State<_MiniToggle> {
  late bool on = widget.initial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => on = !on),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 48,
        height: 28,
        decoration: BoxDecoration(color: on ? good : cream2, borderRadius: BorderRadius.circular(99)),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 220),
          alignment: on ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(width: 22, height: 22, margin: const EdgeInsets.all(3), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
        ),
      ),
    );
  }
}