import 'package:flutter/material.dart';

class DiscoverShop {
  final String name, emoji, dist;
  final Color brand;
  bool joined;
  
  DiscoverShop(
    this.name,
    this.emoji,
    this.dist,
    this.brand, {
    this.joined = false,
  });
}