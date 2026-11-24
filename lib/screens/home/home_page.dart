

// import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/theme/app_theme.dart';
// import '../../data/models/business.dart';
// import '../../data/providers/moury_store.dart';
// import '../../widgets/animations/bob.dart';
// import '../../widgets/animations/press_effect.dart';
// import '../../widgets/common/app_card.dart';
// import '../../widgets/common/bee_button.dart';
// import '../../widgets/common/bee_toast.dart';
// import '../../widgets/common/section_title.dart';
// import '../../widgets/shared/reward_tile.dart';
// import '../../utils/navigation.dart';
// import '../root_shell.dart';
// import '../qr/my_qr_screen.dart';
// import '../scan/scan_screen.dart';
// import '../history/history_screen.dart';
// import '../reward/reward_screen.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: store,
//       builder: (context, _) => ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           _buildHeader(context),
//           SectionTitle('🏪 Your places', trailing: _LinkText('Add more', tab: 1)),
//           _buildBusinessList(context),
//           SectionTitle('⚡ Quick actions'),
//           _buildQuickActions(context),
//           SectionTitle('🔥 Almost there!'),
//           _buildPromotionCard(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(colors: [honey, honeyDeep]),
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Namaste 🙏', style: fred(15, w: FontWeight.w500, color: beeDark)),
//           Text('Aarav', style: fred(26, w: FontWeight.w700)),
//           const SizedBox(height: 14),
//           PressEffect(
//             onTap: () => _goToTab(context, 2),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//               decoration: BoxDecoration(
//                 color: beeDark,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 children: [
//                   const Bob(dy: 4, child: Text('🍯', style: TextStyle(fontSize: 32))),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             Text('${store.honeyDrops}', style: fred(26, w: FontWeight.w700, color: honey)),
//                             const SizedBox(width: 6),
//                             Text('Honey Drops', style: fred(13, color: honey)),
//                           ],
//                         ),
//                         Text('Your Moury-wide reward balance', style: fred(11, w: FontWeight.w500, color: cream2)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBusinessList(BuildContext context) {
//     return SizedBox(
//       height: 132,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.fromLTRB(22, 12, 22, 6),
//         children: [
//           for (final b in store.businesses) _businessCard(context, b),
//           _addCard(context),
//         ],
//       ),
//     );
//   }

//   Widget _businessCard(BuildContext context, Business b) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 14),
//       child: PressEffect(
//         onTap: () => Navigator.push(context, slideUp(BizDetailScreen(b))),
//         child: Container(
//           width: 150,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [b.brand, b.deep]),
//             borderRadius: BorderRadius.circular(22),
//             boxShadow: [BoxShadow(color: b.deep.withOpacity(0.35), blurRadius: 16, offset: const Offset(0, 8))],
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: -20,
//                 bottom: -20,
//                 child: Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle)),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(b.emoji, style: const TextStyle(fontSize: 36)),
//                   const SizedBox(height: 8),
//                   Text(b.name, style: fred(16, w: FontWeight.w700, color: b.ink)),
//                   const SizedBox(height: 2),
//                   Text(b.type == 'punch' ? '⭕ ${b.punch}/${b.punchMax} stamps' : '🍯 ${b.pts} points', style: fred(12, w: FontWeight.w500, color: b.ink)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _addCard(BuildContext context) => PressEffect(
//     onTap: () => _goToTab(context, 1),
//     child: Container(
//       width: 116,
//       decoration: BoxDecoration(
//         color: honeyDeep.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: amber, width: 2.4),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('+', style: fred(34, w: FontWeight.w600, color: amber)),
//           Text('Add shop', style: fred(13, w: FontWeight.w600, color: amber)),
//         ],
//       ),
//     ),
//   );

//   Widget _buildQuickActions(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 22),
//       child: GridView.count(
//         crossAxisCount: 2,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         mainAxisSpacing: 12,
//         crossAxisSpacing: 12,
//         childAspectRatio: 2.6,
//         children: [
//           _actionTile('📲', 'My QR', 'Earn at checkout', () => Navigator.push(context, slideUp(const MyQrScreen()))),
//           _actionTile('📷', 'Scan', 'Join a shop', () => Navigator.push(context, slideUp(const ScanScreen(mode: 'customer')))),
//           _actionTile('📍', 'Nearby', 'Find shops', () => _goToTab(context, 1)),
//           _actionTile('🕑', 'History', 'Points & rewards', () => Navigator.push(context, slideUp(const HistoryScreen()))),
//         ],
//       ),
//     );
//   }

//   Widget _actionTile(String icon, String title, String subtitle, VoidCallback onTap) => PressEffect(
//     onTap: onTap,
//     child: AppCard(
//       padding: const EdgeInsets.all(14),
//       child: Row(
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(color: cream2, borderRadius: BorderRadius.circular(14)),
//             child: Center(child: Text(icon, style: const TextStyle(fontSize: 22))),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(title, style: fred(15, w: FontWeight.w600)),
//                 Text(subtitle, style: nun(11)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   Widget _buildPromotionCard(BuildContext context) {
//     final b = store.businesses[0];
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
//       child: PressEffect(
//         onTap: () => Navigator.push(context, slideUp(BizDetailScreen(b))),
//         child: AppCard(
//           child: Row(
//             children: [
//               const Text('☕', style: TextStyle(fontSize: 34)),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Honeycomb Café', style: fred(15, w: FontWeight.w600)),
//                     const SizedBox(height: 8),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(99),
//                       child: LinearProgressIndicator(
//                         value: b.punch / b.punchMax,
//                         minHeight: 9,
//                         backgroundColor: cream2,
//                         valueColor: const AlwaysStoppedAnimation(honeyDeep),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text('${b.punchMax - b.punch} more stamp(s) = free coffee! ☕', style: nun(11)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Fixed navigation function - simplified version
//   void _goToTab(BuildContext context, int index) {
//     final customerShellState = context.findAncestorStateOfType<CustomerShellState>();
//     customerShellState?.goTab(index);
//   }
// }

// class _LinkText extends StatelessWidget {
//   final String text;
//   final int tab;
//   const _LinkText(this.text, {required this.tab});

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: () {
//       final customerShellState = context.findAncestorStateOfType<CustomerShellState>();
//       customerShellState?.goTab(tab);
//     },
//     child: Text(
//       text,
//       style: fred(13, w: FontWeight.w600, color: amber),
//     ),
//   );
// }

// // BizDetailScreen class remains the same...
// class BizDetailScreen extends StatelessWidget {
//   final Business b;
//   const BizDetailScreen(this.b, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cream,
//       body: AnimatedBuilder(
//         animation: store,
//         builder: (context, _) => ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             _buildHero(context),
//             if (b.type == 'punch') _buildPunchCard(),
//             SectionTitle('🎁 Rewards'),
//             _buildRewardsList(context),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 14, 22, 0),
//               child: BeeButton('📲 Show my QR to earn here', onTap: () => Navigator.push(context, slideUp(const MyQrScreen()))),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 14, 22, 30),
//               child: Text("This is ${b.name}'s very own loyalty space — powered quietly by Moury. 🐝", textAlign: TextAlign.center, style: nun(12)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHero(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [b.brand, b.deep]),
//         borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _circleBtn(Icons.arrow_back, () => Navigator.pop(context)),
//               _circleBtn(Icons.info_outline, () => showBeeToast(context, 'ℹ️ Shop info')),
//             ],
//           ),
//           const SizedBox(height: 14),
//           Row(
//             children: [
//               Container(
//                 width: 62,
//                 height: 62,
//                 decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(20)),
//                 child: Center(child: Text(b.emoji, style: const TextStyle(fontSize: 34))),
//               ),
//               const SizedBox(width: 14),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(b.name, style: fred(24, w: FontWeight.w700, color: b.ink)),
//                   Text(b.tagline, style: fred(13, w: FontWeight.w500, color: b.ink.withOpacity(0.85))),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 18),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(b.type == 'punch' ? '${b.punch}/${b.punchMax}' : '${b.pts}', style: fred(50, w: FontWeight.w700, color: b.ink)),
//               const SizedBox(width: 8),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Text(b.type == 'punch' ? 'stamps' : 'points', style: fred(16, w: FontWeight.w600, color: b.ink.withOpacity(0.9))),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//             decoration: BoxDecoration(color: Colors.black.withOpacity(0.18), borderRadius: BorderRadius.circular(99)),
//             child: Text('${b.tier == "Gold" ? "🥇" : b.tier == "Silver" ? "🥈" : "🥉"} ${b.tier} member', style: fred(12, w: FontWeight.w600, color: b.ink)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPunchCard() {
//     return Column(
//       children: [
//         Padding(padding: const EdgeInsets.fromLTRB(22, 20, 22, 0), child: Text('⭕ Punch card', style: fred(15, w: FontWeight.w600))),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(22, 6, 22, 0),
//           child: AppCard(
//             child: Column(
//               children: [
//                 Wrap(
//                   spacing: 10,
//                   runSpacing: 10,
//                   children: List.generate(b.punchMax, (i) => _stamp(i)),
//                 ),
//                 const SizedBox(height: 10),
//                 Align(alignment: Alignment.centerLeft, child: Text('${b.punchMax - b.punch} more to your free reward! 🎉', style: nun(12))),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRewardsList(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 22),
//       child: Column(children: [for (final r in b.rewards) RewardTile(reward: r, accent: b.brand)]),
//     );
//   }

//   Widget _stamp(int i) {
//     // final size = (MediaQuery.of(context).size.width - 22 * 2 - 18 - 10 * 4) / 5;
//     final on = i < b.punch;
//     final isFree = i == b.punchMax - 1 && !on;
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: on ? 0 : 1, end: 1),
//       duration: Duration(milliseconds: 300 + i * 40),
//       curve: Curves.elasticOut,
//       builder: (_, v, child) => Transform.scale(scale: on ? v : 1, child: child),
//       child: Container(
//         // width: size,
//         // height: size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: on ? LinearGradient(colors: [b.brand, b.deep]) : null,
//           color: on ? null : cream,
//           border: on ? null : Border.all(color: isFree ? b.brand : const Color(0xFFCDB98E), width: 2.4),
//         ),
//         child: Center(child: Text(isFree ? 'FREE' : b.emoji, style: fred(isFree ? 11 : 18, w: FontWeight.w700, color: on ? Colors.white : (isFree ? b.brand : const Color(0xFFCDB98E))))),
//       ),
//     );
//   }

//   Widget _circleBtn(IconData icon, VoidCallback onTap) => GestureDetector(
//     onTap: onTap,
//     child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), shape: BoxShape.circle), child: Icon(icon, color: Colors.white, size: 20)),
//   );
// }

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/business.dart';
import '../../data/providers/moury_store.dart';
import '../../widgets/animations/bob.dart';
import '../../widgets/animations/press_effect.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/bee_button.dart';
import '../../widgets/common/bee_toast.dart';
import '../../widgets/common/section_title.dart';
import '../../widgets/shared/reward_tile.dart';
import '../../utils/navigation.dart';
import '../root_shell.dart';
import '../qr/my_qr_screen.dart';
import '../scan/scan_screen.dart';
import '../history/history_screen.dart';
import '../reward/reward_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) => SingleChildScrollView(  // Wrap with SingleChildScrollView
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            SectionTitle('🏪 Your places', trailing: _LinkText('Add more', tab: 1)),
            _buildBusinessList(context),
            const SizedBox(height: 8),
            SectionTitle('⚡ Quick actions'),
            _buildQuickActions(context),
            const SizedBox(height: 8),
            SectionTitle('🔥 Almost there!'),
            _buildPromotionCard(context),
            const SizedBox(height: 24), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [honey, honeyDeep]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Namaste 🙏', style: fred(15, w: FontWeight.w500, color: beeDark)),
          Text('Aarav', style: fred(26, w: FontWeight.w700)),
          const SizedBox(height: 14),
          PressEffect(
            onTap: () => _goToTab(context, 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: beeDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Bob(dy: 4, child: Text('🍯', style: TextStyle(fontSize: 32))),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${store.honeyDrops}', style: fred(26, w: FontWeight.w700, color: honey)),
                            const SizedBox(width: 6),
                            Flexible(  // Make this flexible to prevent overflow
                              child: Text('Honey Drops', style: fred(13, color: honey)),
                            ),
                          ],
                        ),
                        Text('Your Moury-wide reward balance', style: fred(11, w: FontWeight.w500, color: cream2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessList(BuildContext context) {
    return SizedBox(
      height: 130,  // Reduced from 132
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),  // Reduced padding
        children: [
          for (final b in store.businesses) _businessCard(context, b),
          _addCard(context),
        ],
      ),
    );
  }

  Widget _businessCard(BuildContext context, Business b) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: PressEffect(
        onTap: () => Navigator.push(context, slideUp(BizDetailScreen(b))),
        child: Container(
          width: 140,  // Reduced from 150
          padding: const EdgeInsets.all(12),  // Reduced from 16
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [b.brand, b.deep]),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [BoxShadow(color: b.deep.withOpacity(0.35), blurRadius: 16, offset: const Offset(0, 8))],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(width: 70, height: 70, decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(b.emoji, style: const TextStyle(fontSize: 30)),  // Reduced from 36
                  const SizedBox(height: 6),  // Reduced from 8
                  Text(
                    b.name,
                    style: fred(14, w: FontWeight.w700, color: b.ink),  // Reduced from 16
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    b.type == 'punch' ? '⭕ ${b.punch}/${b.punchMax} stamps' : '🍯 ${b.pts} points',
                    style: fred(10, w: FontWeight.w500, color: b.ink),  // Reduced from 12
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addCard(BuildContext context) => PressEffect(
    onTap: () => _goToTab(context, 1),
    child: Container(
      width: 100,  // Reduced from 116
      decoration: BoxDecoration(
        color: honeyDeep.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: amber, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+', style: fred(28, w: FontWeight.w600, color: amber)),  // Reduced from 34
          Text('Add shop', style: fred(11, w: FontWeight.w600, color: amber)),  // Reduced from 13
        ],
      ),
    ),
  );

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,  // Reduced from 12
        crossAxisSpacing: 10,  // Reduced from 12
        childAspectRatio: 2.8,  // Adjusted from 2.6 (taller)
        children: [
          _actionTile('📲', 'My QR', 'Earn', () => Navigator.push(context, slideUp(const MyQrScreen()))),  // Shorter text
          _actionTile('📷', 'Scan', 'Join', () => Navigator.push(context, slideUp(const ScanScreen(mode: 'customer')))),
          _actionTile('📍', 'Nearby', 'Find', () => _goToTab(context, 1)),
          _actionTile('🕑', 'History', 'Rewards', () => Navigator.push(context, slideUp(const HistoryScreen()))),
        ],
      ),
    );
  }

  Widget _actionTile(String icon, String title, String subtitle, VoidCallback onTap) => PressEffect(
    onTap: onTap,
    child: AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),  // Reduced padding
      child: Row(
        children: [
          Container(
            width: 38,  // Reduced from 44
            height: 38,  // Reduced from 44
            decoration: BoxDecoration(color: cream2, borderRadius: BorderRadius.circular(12)),  // Reduced radius
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 18))),  // Reduced from 22
          ),
          const SizedBox(width: 10),  // Reduced from 12
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: fred(13, w: FontWeight.w600)),  // Reduced from 15
                const SizedBox(height: 2),
                Text(subtitle, style: nun(10)),  // Reduced from 11
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildPromotionCard(BuildContext context) {
    final b = store.businesses[0];
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
      child: PressEffect(
        onTap: () => Navigator.push(context, slideUp(BizDetailScreen(b))),
        child: AppCard(
          padding: const EdgeInsets.all(12),  // Reduced padding
          child: Row(
            children: [
              const Text('☕', style: TextStyle(fontSize: 28)),  // Reduced from 34
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Honeycomb Café', style: fred(14, w: FontWeight.w600)),  // Reduced from 15
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: LinearProgressIndicator(
                        value: b.punch / b.punchMax,
                        minHeight: 6,  // Reduced from 9
                        backgroundColor: cream2,
                        valueColor: const AlwaysStoppedAnimation(honeyDeep),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${b.punchMax - b.punch} more = free coffee!',
                      style: nun(10),  // Reduced from 11
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToTab(BuildContext context, int index) {
    final customerShellState = context.findAncestorStateOfType<CustomerShellState>();
    customerShellState?.goTab(index);
  }
}

class _LinkText extends StatelessWidget {
  final String text;
  final int tab;
  const _LinkText(this.text, {required this.tab});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      final customerShellState = context.findAncestorStateOfType<CustomerShellState>();
      customerShellState?.goTab(tab);
    },
    child: Text(
      text,
      style: fred(12, w: FontWeight.w600, color: amber),  // Reduced from 13
    ),
  );
}

// BizDetailScreen class (keep the same as before)
class BizDetailScreen extends StatelessWidget {
  final Business b;
  const BizDetailScreen(this.b, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: AnimatedBuilder(
        animation: store,
        builder: (context, _) => ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHero(context),
            if (b.type == 'punch') _buildPunchCard(),
            SectionTitle('🎁 Rewards'),
            _buildRewardsList(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 14, 22, 0),
              child: BeeButton('📲 Show my QR to earn here', onTap: () => Navigator.push(context, slideUp(const MyQrScreen()))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 14, 22, 30),
              child: Text("This is ${b.name}'s very own loyalty space — powered quietly by Moury. 🐝", textAlign: TextAlign.center, style: nun(12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [b.brand, b.deep]),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circleBtn(Icons.arrow_back, () => Navigator.pop(context)),
              _circleBtn(Icons.info_outline, () => showBeeToast(context, 'ℹ️ Shop info')),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text(b.emoji, style: const TextStyle(fontSize: 34))),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(b.name, style: fred(24, w: FontWeight.w700, color: b.ink)),
                  Text(b.tagline, style: fred(13, w: FontWeight.w500, color: b.ink.withOpacity(0.85))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(b.type == 'punch' ? '${b.punch}/${b.punchMax}' : '${b.pts}', style: fred(50, w: FontWeight.w700, color: b.ink)),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(b.type == 'punch' ? 'stamps' : 'points', style: fred(16, w: FontWeight.w600, color: b.ink.withOpacity(0.9))),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.18), borderRadius: BorderRadius.circular(99)),
            child: Text('${b.tier == "Gold" ? "🥇" : b.tier == "Silver" ? "🥈" : "🥉"} ${b.tier} member', style: fred(12, w: FontWeight.w600, color: b.ink)),
          ),
        ],
      ),
    );
  }

  Widget _buildPunchCard() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.fromLTRB(22, 20, 22, 0), child: Text('⭕ Punch card', style: fred(15, w: FontWeight.w600))),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 6, 22, 0),
          child: AppCard(
            child: Column(
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(b.punchMax, (i) => _stamp(i)),
                ),
                const SizedBox(height: 10),
                Align(alignment: Alignment.centerLeft, child: Text('${b.punchMax - b.punch} more to your free reward! 🎉', style: nun(12))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardsList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(children: [for (final r in b.rewards) RewardTile(reward: r, accent: b.brand)]),
    );
  }

  Widget _stamp(int i) {
    // final size = (MediaQuery.of(context).size.width - 22 * 2 - 18 - 10 * 4) / 5;
    final on = i < b.punch;
    final isFree = i == b.punchMax - 1 && !on;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: on ? 0 : 1, end: 1),
      duration: Duration(milliseconds: 300 + i * 40),
      curve: Curves.elasticOut,
      builder: (_, v, child) => Transform.scale(scale: on ? v : 1, child: child),
      child: Container(
        // width: size,
        // height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: on ? LinearGradient(colors: [b.brand, b.deep]) : null,
          color: on ? null : cream,
          border: on ? null : Border.all(color: isFree ? b.brand : const Color(0xFFCDB98E), width: 2.4),
        ),
        child: Center(child: Text(isFree ? 'FREE' : b.emoji, style: fred(isFree ? 11 : 18, w: FontWeight.w700, color: on ? Colors.white : (isFree ? b.brand : const Color(0xFFCDB98E))))),
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.white.withOpacity(0.22), shape: BoxShape.circle), child: Icon(icon, color: Colors.white, size: 20)),
  );
}