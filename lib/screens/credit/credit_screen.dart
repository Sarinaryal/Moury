import 'package:flutter/material.dart';
import 'dart:math';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/common/bee_button.dart';
import '../../../widgets/animations/confetti.dart';
import '../../../widgets/common/bee_toast.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  int amount = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF8140E06),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCreditCard(context),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 28, backgroundColor: cream2, child: const Text('🧑', style: TextStyle(fontSize: 32))),
          const SizedBox(height: 8),
          Text('Aarav Sharma', style: fred(20, w: FontWeight.w700)),
          Text('Member · 450 Honey Drops', style: nun(12)),
          const SizedBox(height: 18),
          Text('Points to credit', style: fred(13, w: FontWeight.w600)),
          const SizedBox(height: 8),
          _buildAmountSelector(),
          const SizedBox(height: 14),
          BeeButton(
            '✓ Credit points',
            onTap: () {
              final root = Navigator.of(context, rootNavigator: true).context;
              Navigator.pop(context);
              showConfetti(root);
              showBeeToast(root, '✅ Credited $amount points to Aarav!');
            },
          ),
          const SizedBox(height: 10),
          BeeButton(
            '⭕ Punch card instead',
            variant: 'ghost',
            onTap: () {
              final root = Navigator.of(context, rootNavigator: true).context;
              Navigator.pop(context);
              showConfetti(root);
              showBeeToast(root, '⭕ Card punched! 9/10 — 1 to go');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAmountSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _adjustButton('-', () => setState(() => amount = max(0, amount - 10))),
        SizedBox(
          width: 90,
          child: Text(
            '$amount',
            textAlign: TextAlign.center,
            style: fred(48, w: FontWeight.w700, color: amber),
          ),
        ),
        _adjustButton('+', () => setState(() => amount += 10)),
      ],
    );
  }

  Widget _adjustButton(String symbol, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: cream2, shape: BoxShape.circle),
        child: Center(child: Text(symbol, style: fred(26, w: FontWeight.w700))),
      ),
    );
  }
}