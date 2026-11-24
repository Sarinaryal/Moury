import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';

void showBeeToast(BuildContext context, String msg) {
  final overlay = Overlay.of(context, rootOverlay: true);
  late OverlayEntry entry;
  entry = OverlayEntry(builder: (_) => _Toast(msg: msg, onDone: () => entry.remove()));
  overlay.insert(entry);
}

class _Toast extends StatefulWidget {
  final String msg;
  final VoidCallback onDone;
  const _Toast({required this.msg, required this.onDone});

  @override
  State<_Toast> createState() => _ToastState();
}

class _ToastState extends State<_Toast> {
  double o = 0, dy = 30;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
      o = 1;
      dy = 0;
    }));
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) setState(() {
        o = 0;
        dy = 30;
      });
      Future.delayed(const Duration(milliseconds: 350), widget.onDone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 120,
      child: IgnorePointer(
        child: AnimatedOpacity(
          opacity: o,
          duration: const Duration(milliseconds: 300),
          child: AnimatedSlide(
            offset: Offset(0, dy / 100),
            duration: const Duration(milliseconds: 300),
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  decoration: BoxDecoration(
                    color: beeDark,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)],
                  ),
                  child: Text(widget.msg, style: fred(14, w: FontWeight.w600, color: honey)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}