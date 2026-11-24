import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/common/app_card.dart';

class BMembersPage extends StatelessWidget {
  const BMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildHeader(),
        _buildSearchBar(),
        _buildMemberList(),
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
      child: Text('👥 Members', style: fred(22, w: FontWeight.w700, color: honey)),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            const Icon(Icons.search, color: beeSoft),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: fred(15, w: FontWeight.w500),
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Search members...'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberList() {
    return Column(
      children: [
        _memberTile('🧑', 'Aarav Sharma', 'Gold · 14 visits', '450 🍯'),
        _memberTile('👩', 'Sita Gurung', 'Silver · 8 visits', '8/10'),
        _memberTile('🧔', 'Bikash Rai', 'Gold · 21 visits', '120 🍯'),
        _memberTile('👧', 'Priya Thapa', 'Bronze · 3 visits', '60 🍯'),
        _memberTile('👨', 'Rajesh KC', 'Silver · 11 visits', '230 🍯'),
      ],
    );
  }

  Widget _memberTile(String avatar, String name, String subtitle, String value) {
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