import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/business.dart';
import '../../../widgets/shared/reward_tile.dart';

class RewardScreen extends StatelessWidget {
  final Business business;
  const RewardScreen({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        title: Text('${business.emoji} ${business.name} Rewards', style: fred(20, w: FontWeight.w700)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: beeDark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          for (final reward in business.rewards)
            RewardTile(reward: reward, accent: business.brand),
        ],
      ),
    );
  }
}