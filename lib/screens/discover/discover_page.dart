// import 'package:flutter/material.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/theme/app_theme.dart';
// import '../../data/providers/moury_store.dart';
// import '../../widgets/animations/confetti.dart';
// import '../../widgets/animations/press_effect.dart';
// import '../../widgets/common/app_card.dart';
// import '../../widgets/common/bee_toast.dart';

// class DiscoverPage extends StatelessWidget {
//   const DiscoverPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: store,
//       builder: (context, _) => ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           _buildHeader(),
//           _buildSearchBar(),
//           _buildCategories(),
//           const SizedBox(height: 12),
//           for (int i = 0; i < store.discover.length; i++) _shopCard(context, i),
//           _buildFooter(),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(colors: [honey, honeyDeep]),
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Discover & join', style: fred(13, w: FontWeight.w500, color: beeDark)),
//           Text('Shops near you 📍', style: fred(24, w: FontWeight.w700)),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: AppCard(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//         child: Row(
//           children: [
//             const Icon(Icons.search, color: beeSoft),
//             const SizedBox(width: 10),
//             Expanded(
//               child: TextField(
//                 style: fred(15, w: FontWeight.w500),
//                 decoration: const InputDecoration(border: InputBorder.none, hintText: 'Search cafés, restaurants, shops...'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategories() {
//     return SizedBox(
//       height: 36,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 22),
//         children: [
//           _pill('All', active: true),
//           _pill('☕ Cafés'),
//           _pill('🍜 Restaurants'),
//           _pill('🧁 Bakeries'),
//           _pill('💈 Salons'),
//         ],
//       ),
//     );
//   }

//   Widget _pill(String text, {bool active = false}) => Container(
//     margin: const EdgeInsets.only(right: 8),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     decoration: BoxDecoration(color: active ? beeDark : cream2, borderRadius: BorderRadius.circular(99)),
//     child: Text(text, style: fred(11, w: FontWeight.w600, color: active ? honey : beeSoft)),
//   );

//   Widget _shopCard(BuildContext context, int index) {
//     final shop = store.discover[index];
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
//       child: AppCard(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           children: [
//             Container(
//               width: 54,
//               height: 54,
//               decoration: BoxDecoration(color: shop.brand.withOpacity(0.13), borderRadius: BorderRadius.circular(16)),
//               child: Center(child: Text(shop.emoji, style: const TextStyle(fontSize: 28))),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(shop.name, style: fred(16, w: FontWeight.w600)),
//                   Text('${shop.dist} · ⭐ 4.${5 + index % 4}', style: nun(12)),
//                 ],
//               ),
//             ),
//             PressEffect(
//               onTap: () {
//                 if (shop.joined) return;
//                 store.joinShop(index);
//                 showConfetti(context);
//                 showBeeToast(context, '🎉 Joined ${shop.name}! +20 🍯 welcome bonus');
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                 decoration: BoxDecoration(color: shop.joined ? good : honey, borderRadius: BorderRadius.circular(12)),
//                 child: Text(shop.joined ? '✓ Joined' : 'Join', style: fred(13, w: FontWeight.w600, color: shop.joined ? Colors.white : beeDark)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFooter() {
//     return Padding(
//       padding: const EdgeInsets.all(22),
//       child: Text(
//         'Joining shares your name & number with the shop so they can reward you. You can leave anytime. 🔒',
//         textAlign: TextAlign.center,
//         style: nun(12),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../data/providers/moury_store.dart';
import '../../widgets/animations/press_effect.dart';
import '../../widgets/animations/confetti.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/common/bee_toast.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) => ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildCategories(),
          const SizedBox(height: 12),
          for (int i = 0; i < store.discover.length; i++) _shopCard(context, i),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [honey, honeyDeep]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Discover & join', style: fred(13, w: FontWeight.w500, color: beeDark)),
          Text('Shops near you 📍', style: fred(24, w: FontWeight.w700)),
        ],
      ),
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
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Search cafés, restaurants, shops...'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        children: [
          _pill('All', active: true),
          _pill('☕ Cafés'),
          _pill('🍜 Restaurants'),
          _pill('🧁 Bakeries'),
          _pill('💈 Salons'),
        ],
      ),
    );
  }

  Widget _pill(String text, {bool active = false}) => Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: active ? beeDark : cream2, borderRadius: BorderRadius.circular(99)),
    child: Text(text, style: fred(11, w: FontWeight.w600, color: active ? honey : beeSoft)),
  );

  Widget _shopCard(BuildContext context, int index) {
    final shop = store.discover[index];
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
      child: AppCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(color: shop.brand.withOpacity(0.13), borderRadius: BorderRadius.circular(16)),
              child: Center(child: Text(shop.emoji, style: const TextStyle(fontSize: 28))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shop.name, style: fred(16, w: FontWeight.w600)),
                  Text('${shop.dist} · ⭐ 4.${5 + index % 4}', style: nun(12)),
                ],
              ),
            ),
            PressEffect(
              onTap: () {
                if (shop.joined) return;
                store.joinShop(index);
                showConfetti(context);
                showBeeToast(context, '🎉 Joined ${shop.name}! +20 🍯 welcome bonus');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(color: shop.joined ? good : honey, borderRadius: BorderRadius.circular(12)),
                child: Text(shop.joined ? '✓ Joined' : 'Join', style: fred(13, w: FontWeight.w600, color: shop.joined ? Colors.white : beeDark)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Text(
        'Joining shares your name & number with the shop so they can reward you. You can leave anytime. 🔒',
        textAlign: TextAlign.center,
        style: nun(12),
      ),
    );
  }
}