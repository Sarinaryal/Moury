import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/providers/moury_store.dart';
import '../../widgets/animations/bob.dart';
import '../../widgets/common/app_card.dart';
import '../../utils/navigation.dart';
import '../qr/my_qr_screen.dart';
import '../history/history_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeader(),
        _buildStats(),
        _menuTile(context, '📲', 'My Moury QR', () => Navigator.push(context, slideUp(const MyQrScreen()))),
        _menuTile(context, '🧾', 'Redemption history', () => Navigator.push(context, slideUp(const HistoryScreen()))),
        _toggleTile('🔔', 'Notifications', true),
        _toggleTile('📍', 'Location for nearby shops', true),
        _menuTile(context, '🔒', 'Privacy & data sharing', () {}),
        _menuTile(context, '❓', 'Help & support', () {}),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [honey, amber]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const Bob(
            child: CircleAvatar(radius: 42, backgroundColor: beeDark, child: Text('🐝', style: TextStyle(fontSize: 40))),
          ),
          const SizedBox(height: 12),
          Text('Aarav Sharma', style: fred(24, w: FontWeight.w700, color: Colors.white)),
          Text('+977 98••••321 · member since 2024', style: fred(13, w: FontWeight.w500, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          _statCard('5', 'Shops joined'),
          const SizedBox(width: 12),
          _statCard('${store.honeyDrops}', 'Honey Drops'),
          const SizedBox(width: 12),
          _statCard('23', 'Rewards used'),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) => Expanded(
    child: AppCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(value, style: fred(22, w: FontWeight.w700, color: amber)),
          Text(label, style: nun(11)),
        ],
      ),
    ),
  );

  Widget _menuTile(BuildContext context, String icon, String title, VoidCallback onTap) => InkWell(
    onTap: onTap,
    child: Container(
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
    ),
  );

  Widget _toggleTile(String icon, String title, bool initial) => _MenuToggleTile(icon: icon, title: title, initial: initial);
}

class _MenuToggleTile extends StatefulWidget {
  final String icon, title;
  final bool initial;
  const _MenuToggleTile({required this.icon, required this.title, required this.initial});

  @override
  State<_MenuToggleTile> createState() => _MenuToggleTileState();
}

class _MenuToggleTileState extends State<_MenuToggleTile> {
  late bool on = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: amber.withOpacity(0.08)))),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(color: cream2, borderRadius: BorderRadius.circular(13)),
            child: Center(child: Text(widget.icon, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(widget.title, style: fred(15, w: FontWeight.w600))),
          GestureDetector(
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
          ),
        ],
      ),
    );
  }
}