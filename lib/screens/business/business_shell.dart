import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/common/bee_bottom_bar.dart';
import '../../../utils/navigation.dart';
import '../scan/scan_screen.dart';
import 'b_dash_page.dart';
import 'b_members_page.dart';
import 'b_rewards_page.dart';
import 'b_settings_page.dart';

class BusinessShell extends StatefulWidget {
  const BusinessShell({super.key});

  @override
  State<BusinessShell> createState() => _BusinessShellState();
}

class _BusinessShellState extends State<BusinessShell> {
  int nav = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const BDashPage(),
      const BMembersPage(),
      const BRewardsPage(),
      const BSettingsPage(),
    ];
    return Scaffold(
      backgroundColor: cream,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: KeyedSubtree(key: ValueKey(nav), child: pages[nav]),
      ),
      bottomNavigationBar: BeeBottomBar(
        current: nav,
        items: const [
          BarItem('📊', 'Dash'),
          BarItem('👥', 'Members'),
          BarItem('🎁', 'Rewards'),
          BarItem('⚙️', 'Shop'),
        ],
        onTap: (i) => setState(() => nav = i),
        fabIcon: '📷',
        onFab: () => Navigator.push(context, slideUp(const ScanScreen(mode: 'business'))),
      ),
    );
  }
}