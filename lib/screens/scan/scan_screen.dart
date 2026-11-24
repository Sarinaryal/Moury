import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/providers/moury_store.dart';
import '../../../widgets/animations/confetti.dart';
import '../../../widgets/common/bee_toast.dart';
import '../../../utils/navigation.dart';
import '../credit/credit_screen.dart';

class ScanScreen extends StatefulWidget {
  final String mode; // customer | business
  const ScanScreen({super.key, required this.mode});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with SingleTickerProviderStateMixin {
  late final AnimationController line = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat(reverse: true);
  String hint = 'Hold steady...';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      setState(() => hint = '✓ QR detected!');
      Future.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) return;
        if (widget.mode == 'business') {
          Navigator.pushReplacement(context, slideUp(const CreditScreen()));
        } else {
          final root = Navigator.of(context, rootNavigator: true).context;
          Navigator.pop(context);
          store.notifyListeners();
          showConfetti(root);
          showBeeToast(root, '✅ Joined the shop! Tap it to see rewards');
        }
      });
    });
  }

  @override
  void dispose() {
    line.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF2140E06),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 18,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.mode == 'business' ? 'Scan the customer QR 👤' : 'Point at a shop QR 🐝',
                    style: fred(18, w: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 230,
                    height: 230,
                    child: Stack(
                      children: [
                        _corner(Alignment.topLeft),
                        _corner(Alignment.topRight),
                        _corner(Alignment.bottomLeft),
                        _corner(Alignment.bottomRight),
                        AnimatedBuilder(
                          animation: line,
                          builder: (_, __) => Positioned(
                            top: 14 + line.value * 198,
                            left: 10,
                            right: 10,
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(
                                color: honey,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [BoxShadow(color: honey, blurRadius: 16)],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(hint, style: nun(13, color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _corner(Alignment alignment) {
    final left = alignment.x < 0, top = alignment.y < 0;
    return Align(
      alignment: alignment,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            left: left ? const BorderSide(color: honey, width: 4) : BorderSide.none,
            right: !left ? const BorderSide(color: honey, width: 4) : BorderSide.none,
            top: top ? const BorderSide(color: honey, width: 4) : BorderSide.none,
            bottom: !top ? const BorderSide(color: honey, width: 4) : BorderSide.none,
          ),
        ),
      ),
    );
  }
}