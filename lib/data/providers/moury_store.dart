import 'package:flutter/material.dart';
import '../models/business.dart';
import '../models/discover_shop.dart';
import '../models/history_item.dart';
import '../models/reward.dart';

class MouryStore extends ChangeNotifier {
  int honeyDrops = 1280;

  final List<Business> businesses = [
    Business(
      id: 0,
      name: 'Honeycomb Café',
      emoji: '☕',
      tagline: 'Thamel · Coffee & bakes',
      brand: const Color(0xFFFFC22E),
      deep: const Color(0xFFF5A300),
      ink: const Color(0xFF2B2014),
      pts: 450,
      tier: 'Gold',
      type: 'punch',
      punch: 8,
      punchMax: 10,
      rewards: [
        Reward('☕', 'Free Coffee', 'Complete punch card', '10 punches'),
        Reward('🧁', 'Free Muffin', 'Sweet treat', '300 pts', locked: true),
        Reward('🥪', 'Rs 150 off', 'On any sandwich', '500 pts'),
      ],
    ),
    Business(
      id: 1,
      name: 'Momo Magic',
      emoji: '🥟',
      tagline: 'Patan · Nepali kitchen',
      brand: const Color(0xFFFF7043),
      deep: const Color(0xFFE64A19),
      ink: const Color(0xFF3A1505),
      pts: 230,
      tier: 'Silver',
      type: 'points',
      punch: 0,
      punchMax: 10,
      rewards: [
        Reward('🥟', 'Free plate of momo', 'Steamed or fried', '400 pts', locked: true),
        Reward('🥤', 'Free soft drink', 'With any meal', '150 pts'),
        Reward('🍱', '20% off thali', 'Lunch special', '600 pts', locked: true),
      ],
    ),
    Business(
      id: 2,
      name: 'Bean & Brew',
      emoji: '🫘',
      tagline: 'Lalitpur · Specialty roasts',
      brand: const Color(0xFF6D4C41),
      deep: const Color(0xFF4E342E),
      ink: Colors.white,
      pts: 120,
      tier: 'Bronze',
      type: 'points',
      punch: 0,
      punchMax: 8,
      rewards: [
        Reward('☕', 'Free pour-over', 'Single origin', '350 pts', locked: true),
        Reward('🫘', '200g beans 30% off', 'Take home', '500 pts', locked: true),
        Reward('🥐', 'Free croissant', 'Fresh daily', '250 pts'),
      ],
    ),
    Business(
      id: 3,
      name: 'Sweet Tooth',
      emoji: '🧁',
      tagline: 'Baluwatar · Bakery',
      brand: const Color(0xFFFF6FA3),
      deep: const Color(0xFFE91E63),
      ink: Colors.white,
      pts: 90,
      tier: 'Bronze',
      type: 'punch',
      punch: 3,
      punchMax: 6,
      rewards: [
        Reward('🎂', 'Free slice of cake', 'Choose any', '6 punches'),
        Reward('🍩', 'BOGO donut', 'Weekends', '200 pts', locked: true),
        Reward('🧁', 'Free cupcake', 'Birthday month', 'auto'),
      ],
    ),
  ];

  final List<DiscoverShop> discover = [
    DiscoverShop('Roadhouse Café', '🍕', '0.4 km · Pizza & Italian', const Color(0xFFE64A19)),
    DiscoverShop('Himalayan Java', '☕', '0.6 km · Coffee chain', const Color(0xFF5D4037)),
    DiscoverShop('OR2K', '🥗', '0.8 km · Veg & Middle-eastern', const Color(0xFF43A047)),
    DiscoverShop('Cake Studio', '🎂', '1.1 km · Bakery & desserts', const Color(0xFFEC407A)),
    DiscoverShop('The Snowman', '🍰', '1.3 km · Historic café', const Color(0xFF8D6E63)),
  ];

  final List<HistoryItem> history = [
    HistoryItem('☕', 'Earned at Honeycomb Café', 'Today · 9:42 AM', '+50', 'plus'),
    HistoryItem('🎁', 'Redeemed: Free Coffee', 'Today · 9:43 AM', '-10 punch', 'minus'),
    HistoryItem('🥟', 'Earned at Momo Magic', 'Yesterday · 1:20 PM', '+30', 'plus'),
    HistoryItem('🍯', 'Honey Drops bonus', 'Yesterday · weekend 2x', '+60', 'plus'),
    HistoryItem('🫘', 'Earned at Bean & Brew', '2 days ago', '+25', 'plus'),
    HistoryItem('🎟️', 'Redeemed: Rs 100 off', '3 days ago', '-500 🍯', 'minus'),
  ];

  void joinShop(int i) {
    if (discover[i].joined) return;
    discover[i].joined = true;
    honeyDrops += 20;
    notifyListeners();
  }

  void earnAtHoneycomb() {
    final b = businesses[0];
    b.punch = b.punch.clamp(0, b.punchMax + 1);
    b.punch++;
    honeyDrops += 50;
    notifyListeners();
  }

  bool redeemHoney(int cost) {
    if (honeyDrops < cost) return false;
    honeyDrops -= cost;
    notifyListeners();
    return true;
  }
}

final store = MouryStore();