import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/animations/press_effect.dart';
import '../../../widgets/common/app_card.dart';
import '../../../widgets/common/section_title.dart';
import '../../../utils/navigation.dart';
import '../scan/scan_screen.dart';

class BDashPage extends StatelessWidget {
  const BDashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeader(),
        _buildKPIs(),
        _buildScanButton(context),
        SectionTitle('👥 Recent customers'),
        _buildCustomerList(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 44),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [beeDark, beeSoft]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good morning ☀️', style: fred(14, w: FontWeight.w500, color: Colors.white70)),
          Text('☕ Honeycomb Café', style: fred(24, w: FontWeight.w700, color: honey)),
        ],
      ),
    );
  }

  Widget _buildKPIs() {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: [
            _kpiCard('142', 'Members'),
            const SizedBox(width: 12),
            _kpiCard('28', "Today's visits"),
            const SizedBox(width: 12),
            _kpiCard('9', 'Rewards given'),
          ],
        ),
      ),
    );
  }

  Widget _kpiCard(String value, String label) => Expanded(
    child: AppCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: fred(22, w: FontWeight.w700, color: amber)),
          Text(label, style: nun(11)),
        ],
      ),
    ),
  );

  Widget _buildScanButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
      child: PressEffect(
        onTap: () => Navigator.push(context, slideUp(const ScanScreen(mode: 'business'))),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [honey, honeyDeep]),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: honeyDeep.withOpacity(0.5), blurRadius: 24, offset: const Offset(0, 12))],
          ),
          child: Column(
            children: [
              const Text('📷', style: TextStyle(fontSize: 50)),
              Text('Scan customer QR', style: fred(20, w: FontWeight.w700)),
              Text('Credit points or punch a card', style: fred(13, w: FontWeight.w500, color: beeDark)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerList() {
    return Column(
      children: [
        _customerTile('🧑', 'Aarav Sharma', '2 min ago · +50 pts', '450 🍯'),
        _customerTile('👩', 'Sita Gurung', '18 min ago · card punched', '8/10'),
        _customerTile('🧔', 'Bikash Rai', '1 hr ago · redeemed coffee', '120 🍯'),
      ],
    );
  }

  Widget _customerTile(String avatar, String name, String subtitle, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: amber.withOpacity(0.08)))),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundColor: cream2, child: Text(avatar, style: const TextStyle(fontSize: 20))),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: fred(15, w: FontWeight.w600)),
                Text(subtitle, style: nun(12)),
              ],
            ),
          ),
          Text(value, style: fred(15, w: FontWeight.w700, color: amber)),
        ],
      ),
    );
  }
}