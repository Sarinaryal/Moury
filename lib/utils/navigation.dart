// import 'package:flutter/material.dart';
// import '../screens/qr/my_qr_screen.dart';
// import '../screens/scan/scan_screen.dart';
// import '../screens/history/history_screen.dart';
// import '../screens/reward/reward_screen.dart';

// PageRouteBuilder slideUp(Widget page) => PageRouteBuilder(
//   pageBuilder: (_, a, __) => page,
//   transitionsBuilder: (_, a, __, child) => SlideTransition(
//     position: Tween(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
//     child: child,
//   ),
// );

// void goToTab(BuildContext context, int i) {
//   final st = context.findAncestorStateOfType<_CustomerShellState>();
//   st?.goTab(i);
// }

import 'package:flutter/material.dart';
import '../screens/qr/my_qr_screen.dart';
import '../screens/scan/scan_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/reward/reward_screen.dart';
import '../screens/root_shell.dart'; // Add this import

PageRouteBuilder slideUp(Widget page) => PageRouteBuilder(
      pageBuilder: (_, a, __) => page,
      transitionsBuilder: (_, a, __, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
        child: child,
      ),
    );

// Fixed version - now works with public CustomerShellState
void goToTab(BuildContext context, int index) {
  final customerShell = context.findAncestorStateOfType<CustomerShellState>();
  customerShell?.goTab(index);
}
