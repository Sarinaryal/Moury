import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/animations/bob.dart';
import '../../../widgets/common/app_card.dart';

class BSettingsPage extends StatelessWidget {
  const BSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeader(),
        _buildStats(),
        _menuTile('🏪', 'Business profile & logo'),
        _menuTile('📍', 'Location & hours'),
        _menuTile('🎁', 'Rewards & rules'),
        _menuTile('👨‍🍳', 'Staff & permissions'),
        _menuTile('📊', 'Reports & analytics'),
        _menuTile('📣', 'Send a promo blast'),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [beeDark, beeSoft]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const Bob(
            child: CircleAvatar(radius: 42, backgroundColor: honey, child: Text('☕', style: TextStyle(fontSize: 38))),
          ),
          const SizedBox(height: 12),
          Text('Honeycomb Café', style: fred(24, w: FontWeight.w700, color: honey)),
          Text('Thamel, Kathmandu · Joined 2024', style: fred(13, w: FontWeight.w500, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          _statCard('142', 'Members'),
          const SizedBox(width: 12),
          _statCard('Rs 84k', 'Driven/mo'),
          const SizedBox(width: 12),
          _statCard('4.8★', 'Rating'),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) => Expanded(
    child: AppCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(value, style: fred(20, w: FontWeight.w700, color: amber)),
          Text(label, style: nun(11)),
        ],
      ),
    ),
  );

  Widget _menuTile(String icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: amber.withOpacity(0.08)))),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: cream2, borderRadius: BorderRadius.circular(13)),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: fred(15, w: FontWeight.w600))),
          const Icon(Icons.chevron_right, color: beeSoft),
        ],
      ),
    );
  }
}