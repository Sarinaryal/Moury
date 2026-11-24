import 'package:flutter/material.dart';
import 'reward.dart';

class Business {
  final int id;
  final String name, emoji, tagline;
  final Color brand, deep, ink;
  int pts;
  final String tier;
  final String type; // 'points' | 'punch'
  int punch;
  final int punchMax;
  final List<Reward> rewards;
  
  Business({
    required this.id,
    required this.name,
    required this.emoji,
    required this.tagline,
    required this.brand,
    required this.deep,
    required this.ink,
    required this.pts,
    required this.tier,
    required this.type,
    required this.punch,
    required this.punchMax,
    required this.rewards,
  });
}