// // Moury 🐝 — Loyalty, Sweetened
// // A bee-themed, gamified loyalty platform (mौरी = bee in Nepali).
// // Single-file Flutter prototype. Drop into a fresh `flutter create` project,
// // replace lib/main.dart, add deps from pubspec.yaml, then `flutter run`.

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// void main() => runApp(const MouryApp());

// /* ============================ THEME / TOKENS ============================ */

// const honey = Color(0xFFFFC22E);
// const honeyDeep = Color(0xFFF5A300);
// const amber = Color(0xFFE8861A);
// const beeDark = Color(0xFF2B2014);
// const beeSoft = Color(0xFF4A3826);
// const cream = Color(0xFFFFF7E3);
// const cream2 = Color(0xFFFFEFC9);
// const white = Color(0xFFFFFDF7);
// const good = Color(0xFF5BBE6A);
// const pink = Color(0xFFFF6FA3);

// TextStyle fred(
//   double size, {
//   FontWeight w = FontWeight.w600,
//   Color color = beeDark,
//   double? ls,
// }) => GoogleFonts.fredoka(
//   fontSize: size,
//   fontWeight: w,
//   color: color,
//   letterSpacing: ls,
// );

// TextStyle nun(
//   double size, {
//   FontWeight w = FontWeight.w700,
//   Color color = beeSoft,
// }) => GoogleFonts.nunito(fontSize: size, fontWeight: w, color: color);

// /* ============================ DATA MODELS ============================ */

// class Reward {
//   final String icon, title, sub, cost;
//   bool locked;
//   bool redeemed;
//   Reward(
//     this.icon,
//     this.title,
//     this.sub,
//     this.cost, {
//     this.locked = false,
//     this.redeemed = false,
//   });
// }

// class Business {
//   final int id;
//   final String name, emoji, tagline;
//   final Color brand, deep, ink;
//   int pts;
//   final String tier;
//   final String type; // 'points' | 'punch'
//   int punch;
//   final int punchMax;
//   final List<Reward> rewards;
//   Business({
//     required this.id,
//     required this.name,
//     required this.emoji,
//     required this.tagline,
//     required this.brand,
//     required this.deep,
//     required this.ink,
//     required this.pts,
//     required this.tier,
//     required this.type,
//     required this.punch,
//     required this.punchMax,
//     required this.rewards,
//   });
// }

// class DiscoverShop {
//   final String name, emoji, dist;
//   final Color brand;
//   bool joined;
//   DiscoverShop(
//     this.name,
//     this.emoji,
//     this.dist,
//     this.brand, {
//     this.joined = false,
//   });
// }

// class HistoryItem {
//   final String emoji, title, sub, value, kind; // kind: plus|minus
//   HistoryItem(this.emoji, this.title, this.sub, this.value, this.kind);
// }

// /* ============================ STORE (state) ============================ */

// class MouryStore extends ChangeNotifier {
//   int honeyDrops = 1280;

//   final List<Business> businesses = [
//     Business(
//       id: 0,
//       name: 'Honeycomb Café',
//       emoji: '☕',
//       tagline: 'Thamel · Coffee & bakes',
//       brand: honey,
//       deep: honeyDeep,
//       ink: beeDark,
//       pts: 450,
//       tier: 'Gold',
//       type: 'punch',
//       punch: 8,
//       punchMax: 10,
//       rewards: [
//         Reward('☕', 'Free Coffee', 'Complete punch card', '10 punches'),
//         Reward('🧁', 'Free Muffin', 'Sweet treat', '300 pts', locked: true),
//         Reward('🥪', 'Rs 150 off', 'On any sandwich', '500 pts'),
//       ],
//     ),
//     Business(
//       id: 1,
//       name: 'Momo Magic',
//       emoji: '🥟',
//       tagline: 'Patan · Nepali kitchen',
//       brand: const Color(0xFFFF7043),
//       deep: const Color(0xFFE64A19),
//       ink: const Color(0xFF3A1505),
//       pts: 230,
//       tier: 'Silver',
//       type: 'points',
//       punch: 0,
//       punchMax: 10,
//       rewards: [
//         Reward(
//           '🥟',
//           'Free plate of momo',
//           'Steamed or fried',
//           '400 pts',
//           locked: true,
//         ),
//         Reward('🥤', 'Free soft drink', 'With any meal', '150 pts'),
//         Reward('🍱', '20% off thali', 'Lunch special', '600 pts', locked: true),
//       ],
//     ),
//     Business(
//       id: 2,
//       name: 'Bean & Brew',
//       emoji: '🫘',
//       tagline: 'Lalitpur · Specialty roasts',
//       brand: const Color(0xFF6D4C41),
//       deep: const Color(0xFF4E342E),
//       ink: Colors.white,
//       pts: 120,
//       tier: 'Bronze',
//       type: 'points',
//       punch: 0,
//       punchMax: 8,
//       rewards: [
//         Reward('☕', 'Free pour-over', 'Single origin', '350 pts', locked: true),
//         Reward(
//           '🫘',
//           '200g beans 30% off',
//           'Take home',
//           '500 pts',
//           locked: true,
//         ),
//         Reward('🥐', 'Free croissant', 'Fresh daily', '250 pts'),
//       ],
//     ),
//     Business(
//       id: 3,
//       name: 'Sweet Tooth',
//       emoji: '🧁',
//       tagline: 'Baluwatar · Bakery',
//       brand: pink,
//       deep: const Color(0xFFE91E63),
//       ink: Colors.white,
//       pts: 90,
//       tier: 'Bronze',
//       type: 'punch',
//       punch: 3,
//       punchMax: 6,
//       rewards: [
//         Reward('🎂', 'Free slice of cake', 'Choose any', '6 punches'),
//         Reward('🍩', 'BOGO donut', 'Weekends', '200 pts', locked: true),
//         Reward('🧁', 'Free cupcake', 'Birthday month', 'auto'),
//       ],
//     ),
//   ];

//   final List<DiscoverShop> discover = [
//     DiscoverShop(
//       'Roadhouse Café',
//       '🍕',
//       '0.4 km · Pizza & Italian',
//       const Color(0xFFE64A19),
//     ),
//     DiscoverShop(
//       'Himalayan Java',
//       '☕',
//       '0.6 km · Coffee chain',
//       const Color(0xFF5D4037),
//     ),
//     DiscoverShop(
//       'OR2K',
//       '🥗',
//       '0.8 km · Veg & Middle-eastern',
//       const Color(0xFF43A047),
//     ),
//     DiscoverShop(
//       'Cake Studio',
//       '🎂',
//       '1.1 km · Bakery & desserts',
//       const Color(0xFFEC407A),
//     ),
//     DiscoverShop(
//       'The Snowman',
//       '🍰',
//       '1.3 km · Historic café',
//       const Color(0xFF8D6E63),
//     ),
//   ];

//   final List<HistoryItem> history = [
//     HistoryItem(
//       '☕',
//       'Earned at Honeycomb Café',
//       'Today · 9:42 AM',
//       '+50',
//       'plus',
//     ),
//     HistoryItem(
//       '🎁',
//       'Redeemed: Free Coffee',
//       'Today · 9:43 AM',
//       '-10 punch',
//       'minus',
//     ),
//     HistoryItem(
//       '🥟',
//       'Earned at Momo Magic',
//       'Yesterday · 1:20 PM',
//       '+30',
//       'plus',
//     ),
//     HistoryItem(
//       '🍯',
//       'Honey Drops bonus',
//       'Yesterday · weekend 2x',
//       '+60',
//       'plus',
//     ),
//     HistoryItem('🫘', 'Earned at Bean & Brew', '2 days ago', '+25', 'plus'),
//     HistoryItem(
//       '🎟️',
//       'Redeemed: Rs 100 off',
//       '3 days ago',
//       '-500 🍯',
//       'minus',
//     ),
//   ];

//   void joinShop(int i) {
//     if (discover[i].joined) return;
//     discover[i].joined = true;
//     honeyDrops += 20;
//     notifyListeners();
//   }

//   void earnAtHoneycomb() {
//     final b = businesses[0];
//     b.punch = min(b.punchMax, b.punch + 1);
//     honeyDrops += 50;
//     notifyListeners();
//   }

//   bool redeemHoney(int cost) {
//     if (honeyDrops < cost) return false;
//     honeyDrops -= cost;
//     notifyListeners();
//     return true;
//   }
// }

// final store = MouryStore();

// /* ============================ APP ROOT ============================ */

// class MouryApp extends StatelessWidget {
//   const MouryApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Moury',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: cream,
//         colorScheme: ColorScheme.fromSeed(seedColor: honey, primary: honey),
//         textTheme: GoogleFonts.nunitoTextTheme(),
//         useMaterial3: true,
//       ),
//       home: const RootShell(),
//     );
//   }
// }

// /// Top-level demo shell with a Customer / Business toggle.
// class RootShell extends StatefulWidget {
//   const RootShell({super.key});
//   @override
//   State<RootShell> createState() => _RootShellState();
// }

// class _RootShellState extends State<RootShell> {
//   String mode = 'customer';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: beeDark,
//       body: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             // demo-only mode switcher
//             Container(
//               color: beeDark,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               child: Row(
//                 children: [
//                   const Text('🐝', style: TextStyle(fontSize: 22)),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Moury',
//                     style: fred(20, w: FontWeight.w700, color: honey),
//                   ),
//                   const Spacer(),
//                   _ModeToggle(
//                     mode: mode,
//                     onChanged: (m) => setState(() => mode = m),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 350),
//                 child: mode == 'customer'
//                     ? const CustomerShell(key: ValueKey('cust'))
//                     : const BusinessShell(key: ValueKey('biz')),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ModeToggle extends StatelessWidget {
//   final String mode;
//   final ValueChanged<String> onChanged;
//   const _ModeToggle({required this.mode, required this.onChanged});
//   @override
//   Widget build(BuildContext context) {
//     Widget seg(String id, String label) {
//       final on = mode == id;
//       return GestureDetector(
//         onTap: () => onChanged(id),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 220),
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
//           decoration: BoxDecoration(
//             color: on ? honey : Colors.transparent,
//             borderRadius: BorderRadius.circular(99),
//           ),
//           child: Text(
//             label,
//             style: fred(13, w: FontWeight.w600, color: on ? beeDark : cream2),
//           ),
//         ),
//       );
//     }

//     return Container(
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(99),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           seg('customer', '👤 Customer'),
//           seg('business', '🏪 Business'),
//         ],
//       ),
//     );
//   }
// }

// /* ============================ SHARED WIDGETS ============================ */

// /// Subtle bobbing animation wrapper.
// class Bob extends StatefulWidget {
//   final Widget child;
//   final double dy;
//   final int ms;
//   const Bob({super.key, required this.child, this.dy = 6, this.ms = 2600});
//   @override
//   State<Bob> createState() => _BobState();
// }

// class _BobState extends State<Bob> with SingleTickerProviderStateMixin {
//   late final AnimationController c = AnimationController(
//     vsync: this,
//     duration: Duration(milliseconds: widget.ms),
//   )..repeat(reverse: true);
//   @override
//   void dispose() {
//     c.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: c,
//       builder: (_, child) => Transform.translate(
//         offset: Offset(0, -widget.dy * sin(c.value * pi)),
//         child: child,
//       ),
//       child: widget.child,
//     );
//   }
// }

// /// Honeycomb hex pattern painter for headers.
// class HoneycombPainter extends CustomPainter {
//   final Color color;
//   HoneycombPainter(this.color);
//   @override
//   void paint(Canvas canvas, Size size) {
//     final p = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.4
//       ..color = color;
//     const r = 18.0;
//     final h = r * sqrt(3);
//     for (double y = -h; y < size.height + h; y += h) {
//       int row = (y / h).round();
//       for (double x = -r; x < size.width + 2 * r; x += 3 * r) {
//         final cx = x + (row.isEven ? 0 : 1.5 * r);
//         _hex(canvas, p, Offset(cx, y), r);
//       }
//     }
//   }

//   void _hex(Canvas c, Paint p, Offset center, double r) {
//     final path = Path();
//     for (int i = 0; i < 6; i++) {
//       final a = pi / 3 * i + pi / 6;
//       final pt = Offset(center.dx + r * cos(a), center.dy + r * sin(a));
//       i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
//     }
//     path.close();
//     c.drawPath(path, p);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter old) => false;
// }

// class BeeButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   final String variant; // primary | honey | ghost
//   final IconData? icon;
//   const BeeButton(
//     this.label, {
//     super.key,
//     required this.onTap,
//     this.variant = 'honey',
//     this.icon,
//   });
//   @override
//   Widget build(BuildContext context) {
//     late Color bg, fg;
//     Gradient? grad;
//     switch (variant) {
//       case 'primary':
//         bg = beeDark;
//         fg = honey;
//         break;
//       case 'ghost':
//         bg = beeDark.withOpacity(0.08);
//         fg = beeDark;
//         break;
//       default:
//         grad = const LinearGradient(colors: [honey, honeyDeep]);
//         bg = honey;
//         fg = beeDark;
//     }
//     return _Press(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         decoration: BoxDecoration(
//           color: grad == null ? bg : null,
//           gradient: grad,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: variant == 'ghost'
//               ? null
//               : [
//                   BoxShadow(
//                     color: bg.withOpacity(0.4),
//                     blurRadius: 14,
//                     offset: const Offset(0, 8),
//                   ),
//                 ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (icon != null) ...[
//               Icon(icon, color: fg, size: 18),
//               const SizedBox(width: 8),
//             ],
//             Text(
//               label,
//               style: fred(16, w: FontWeight.w600, color: fg),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Tap-to-shrink micro-interaction.
// class _Press extends StatefulWidget {
//   final Widget child;
//   final VoidCallback onTap;
//   const _Press({required this.child, required this.onTap});
//   @override
//   State<_Press> createState() => _PressState();
// }

// class _PressState extends State<_Press> {
//   double s = 1;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) => setState(() => s = 0.95),
//       onTapUp: (_) => setState(() => s = 1),
//       onTapCancel: () => setState(() => s = 1),
//       onTap: widget.onTap,
//       child: AnimatedScale(
//         scale: s,
//         duration: const Duration(milliseconds: 110),
//         child: widget.child,
//       ),
//     );
//   }
// }

// class AppCard extends StatelessWidget {
//   final Widget child;
//   final EdgeInsets padding;
//   const AppCard({
//     super.key,
//     required this.child,
//     this.padding = const EdgeInsets.all(18),
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding,
//       decoration: BoxDecoration(
//         color: white,
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: Colors.white, width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: beeDark.withOpacity(0.07),
//             blurRadius: 16,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

// Widget sectionTitle(String text, {Widget? trailing}) => Padding(
//   padding: const EdgeInsets.fromLTRB(22, 22, 22, 4),
//   child: Row(
//     children: [
//       Text(text, style: fred(18, w: FontWeight.w600)),
//       const Spacer(),
//       if (trailing != null) trailing,
//     ],
//   ),
// );

// /* ---------- Toast + Confetti overlays ---------- */

// void showBeeToast(BuildContext context, String msg) {
//   final overlay = Overlay.of(context, rootOverlay: true);
//   late OverlayEntry entry;
//   entry = OverlayEntry(
//     builder: (_) => _Toast(msg: msg, onDone: () => entry.remove()),
//   );
//   overlay.insert(entry);
// }

// class _Toast extends StatefulWidget {
//   final String msg;
//   final VoidCallback onDone;
//   const _Toast({required this.msg, required this.onDone});
//   @override
//   State<_Toast> createState() => _ToastState();
// }

// class _ToastState extends State<_Toast> {
//   double o = 0, dy = 30;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => setState(() {
//         o = 1;
//         dy = 0;
//       }),
//     );
//     Future.delayed(const Duration(milliseconds: 2200), () {
//       if (mounted)
//         setState(() {
//           o = 0;
//           dy = 30;
//         });
//       Future.delayed(const Duration(milliseconds: 350), widget.onDone);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: 0,
//       right: 0,
//       bottom: 120,
//       child: IgnorePointer(
//         child: AnimatedOpacity(
//           opacity: o,
//           duration: const Duration(milliseconds: 300),
//           child: AnimatedSlide(
//             offset: Offset(0, dy / 100),
//             duration: const Duration(milliseconds: 300),
//             child: Center(
//               child: Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 22,
//                     vertical: 14,
//                   ),
//                   decoration: BoxDecoration(
//                     color: beeDark,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                   child: Text(
//                     widget.msg,
//                     style: fred(14, w: FontWeight.w600, color: honey),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void showConfetti(BuildContext context) {
//   final overlay = Overlay.of(context, rootOverlay: true);
//   late OverlayEntry entry;
//   entry = OverlayEntry(builder: (_) => _Confetti(onDone: () => entry.remove()));
//   overlay.insert(entry);
// }

// class _Particle {
//   final double x, drift, size, rot;
//   final Color color;
//   _Particle(this.x, this.drift, this.size, this.rot, this.color);
// }

// class _Confetti extends StatefulWidget {
//   final VoidCallback onDone;
//   const _Confetti({required this.onDone});
//   @override
//   State<_Confetti> createState() => _ConfettiState();
// }

// class _ConfettiState extends State<_Confetti>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController c = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1600),
//   )..forward();
//   final rnd = Random();
//   late final List<_Particle> parts;
//   static const colors = [honey, honeyDeep, beeDark, pink, good, Colors.white];

//   @override
//   void initState() {
//     super.initState();
//     parts = List.generate(
//       40,
//       (i) => _Particle(
//         rnd.nextDouble(),
//         (rnd.nextDouble() - 0.5) * 1.2,
//         6 + rnd.nextDouble() * 8,
//         rnd.nextDouble() * 6,
//         colors[i % colors.length],
//       ),
//     );
//     c.addStatusListener((s) {
//       if (s == AnimationStatus.completed) widget.onDone();
//     });
//   }

//   @override
//   void dispose() {
//     c.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       child: AnimatedBuilder(
//         animation: c,
//         builder: (_, __) => CustomPaint(
//           size: Size.infinite,
//           painter: _ConfettiPainter(parts, c.value),
//         ),
//       ),
//     );
//   }
// }

// class _ConfettiPainter extends CustomPainter {
//   final List<_Particle> parts;
//   final double t;
//   _ConfettiPainter(this.parts, this.t);
//   @override
//   void paint(Canvas canvas, Size size) {
//     for (final p in parts) {
//       final y = t * (size.height * 0.9) - 20;
//       final x = p.x * size.width + p.drift * 220 * t;
//       final paint = Paint()..color = p.color.withOpacity((1 - t).clamp(0, 1));
//       canvas.save();
//       canvas.translate(x, y);
//       canvas.rotate(p.rot * t * 4);
//       canvas.drawRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromCenter(
//             center: Offset.zero,
//             width: p.size,
//             height: p.size * 1.4,
//           ),
//           const Radius.circular(2),
//         ),
//         paint,
//       );
//       canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _ConfettiPainter old) => old.t != t;
// }

// /* ============================ CUSTOMER APP ============================ */

// class CustomerShell extends StatefulWidget {
//   const CustomerShell({super.key});
//   @override
//   State<CustomerShell> createState() => _CustomerShellState();
// }

// class _CustomerShellState extends State<CustomerShell> {
//   bool loggedIn = false;
//   int nav = 0;

//   void goTab(int i) => setState(() => nav = i);

//   @override
//   Widget build(BuildContext context) {
//     if (!loggedIn) {
//       return LoginScreen(onDone: () => setState(() => loggedIn = true));
//     }
//     final pages = [
//       const HomePage(),
//       const DiscoverPage(),
//       const HoneyPage(),
//       const ProfilePage(),
//     ];
//     return Scaffold(
//       backgroundColor: cream,
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 350),
//         child: KeyedSubtree(key: ValueKey(nav), child: pages[nav]),
//       ),
//       bottomNavigationBar: BeeBottomBar(
//         current: nav,
//         items: const [
//           BarItem('🏠', 'Home'),
//           BarItem('🧭', 'Discover'),
//           BarItem('🍯', 'Drops'),
//           BarItem('🐝', 'Me'),
//         ],
//         onTap: (i) => setState(() => nav = i),
//         fabIcon: '📲',
//         onFab: () => Navigator.push(context, _slideUp(const MyQrScreen())),
//       ),
//     );
//   }
// }

// PageRouteBuilder _slideUp(Widget page) => PageRouteBuilder(
//   pageBuilder: (_, a, __) => page,
//   transitionsBuilder: (_, a, __, child) => SlideTransition(
//     position: Tween(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: a, curve: Curves.easeOutCubic)),
//     child: child,
//   ),
// );

// /* ---------- Custom bottom bar with center FAB ---------- */

// class BarItem {
//   final String icon, label;
//   const BarItem(this.icon, this.label);
// }

// class BeeBottomBar extends StatefulWidget {
//   final int current;
//   final List<BarItem> items; // expects 4 (FAB sits in the middle)
//   final ValueChanged<int> onTap;
//   final String fabIcon;
//   final VoidCallback onFab;
//   const BeeBottomBar({
//     super.key,
//     required this.current,
//     required this.items,
//     required this.onTap,
//     required this.fabIcon,
//     required this.onFab,
//   });
//   @override
//   State<BeeBottomBar> createState() => _BeeBottomBarState();
// }

// class _BeeBottomBarState extends State<BeeBottomBar>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController pulse = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1400),
//   )..repeat(reverse: true);
//   @override
//   void dispose() {
//     pulse.dispose();
//     super.dispose();
//   }

//   Widget _tab(int i) {
//     final it = widget.items[i];
//     final on = widget.current == i;
//     return Expanded(
//       child: InkWell(
//         onTap: () => widget.onTap(i),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedScale(
//               scale: on ? 1.18 : 1,
//               duration: const Duration(milliseconds: 220),
//               child: Text(it.icon, style: const TextStyle(fontSize: 22)),
//             ),
//             const SizedBox(height: 2),
//             Text(
//               it.label,
//               style: fred(10, w: FontWeight.w600, color: on ? amber : beeSoft),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 86,
//       decoration: BoxDecoration(
//         color: white,
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
//         boxShadow: [
//           BoxShadow(
//             color: beeDark.withOpacity(0.12),
//             blurRadius: 24,
//             offset: const Offset(0, -8),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           _tab(0),
//           _tab(1),
//           // center FAB
//           SizedBox(
//             width: 70,
//             child: Center(
//               child: GestureDetector(
//                 onTap: widget.onFab,
//                 child: ScaleTransition(
//                   scale: Tween(begin: 1.0, end: 1.06).animate(pulse),
//                   child: Container(
//                     width: 58,
//                     height: 58,
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [honey, honeyDeep],
//                       ),
//                       shape: BoxShape.circle,
//                       border: Border.all(color: white, width: 4),
//                       boxShadow: [
//                         BoxShadow(
//                           color: honeyDeep.withOpacity(0.6),
//                           blurRadius: 16,
//                           offset: const Offset(0, 8),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         widget.fabIcon,
//                         style: const TextStyle(fontSize: 24),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           _tab(2),
//           _tab(3),
//         ],
//       ),
//     );
//   }
// }

// /* ---------- Login (mobile + OTP) ---------- */

// class LoginScreen extends StatefulWidget {
//   final VoidCallback onDone;
//   const LoginScreen({super.key, required this.onDone});
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool otpStep = false;
//   final phone = TextEditingController();
//   final otps = List.generate(4, (_) => TextEditingController());
//   final nodes = List.generate(4, (_) => FocusNode());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cream,
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           // header
//           Container(
//             height: 320,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [honey, honeyDeep],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
//             ),
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: CustomPaint(
//                     painter: HoneycombPainter(Colors.white.withOpacity(0.18)),
//                   ),
//                 ),
//                 Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Bob(
//                         dy: 8,
//                         child: Text('🐝', style: TextStyle(fontSize: 84)),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Welcome to Moury',
//                         style: fred(
//                           30,
//                           w: FontWeight.w700,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         'One app. Every loyalty card you love.',
//                         style: fred(
//                           14,
//                           w: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(26),
//             child: otpStep ? _otpView() : _phoneView(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _phoneView() => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Enter your mobile number', style: fred(16, w: FontWeight.w600)),
//       const SizedBox(height: 12),
//       Container(
//         decoration: BoxDecoration(
//           color: white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: cream2, width: 2),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 14),
//         child: Row(
//           children: [
//             Text(
//               '🇳🇵 +977',
//               style: fred(15, w: FontWeight.w600, color: beeSoft),
//             ),
//             Container(
//               width: 2,
//               height: 26,
//               color: cream2,
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//             ),
//             Expanded(
//               child: TextField(
//                 controller: phone,
//                 keyboardType: TextInputType.number,
//                 maxLength: 10,
//                 style: fred(18, w: FontWeight.w600),
//                 decoration: const InputDecoration(
//                   counterText: '',
//                   border: InputBorder.none,
//                   hintText: '98XXXXXXXX',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(height: 14),
//       BeeButton('Send OTP 🍯', onTap: () => setState(() => otpStep = true)),
//       const SizedBox(height: 14),
//       Center(
//         child: Text(
//           "We'll text you a one-time code. No passwords, ever. 🔒",
//           style: nun(13),
//         ),
//       ),
//     ],
//   );

//   Widget _otpView() => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Enter the 4-digit code', style: fred(16, w: FontWeight.w600)),
//       const SizedBox(height: 6),
//       Text(
//         'Sent to +977 ${phone.text.isEmpty ? "98XXXXXXXX" : phone.text}',
//         style: nun(13),
//       ),
//       const SizedBox(height: 18),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           for (int i = 0; i < 4; i++)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: SizedBox(
//                 width: 56,
//                 height: 64,
//                 child: TextField(
//                   controller: otps[i],
//                   focusNode: nodes[i],
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   maxLength: 1,
//                   style: fred(26, w: FontWeight.w700),
//                   decoration: InputDecoration(
//                     counterText: '',
//                     filled: true,
//                     fillColor: white,
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: const BorderSide(color: cream2, width: 2),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: const BorderSide(color: honey, width: 2),
//                     ),
//                   ),
//                   onChanged: (v) {
//                     if (v.isNotEmpty && i < 3) nodes[i + 1].requestFocus();
//                   },
//                 ),
//               ),
//             ),
//         ],
//       ),
//       const SizedBox(height: 20),
//       BeeButton('Verify & Enter 🐝', onTap: widget.onDone),
//       const SizedBox(height: 12),
//       Center(
//         child: TextButton(
//           onPressed: () => setState(() => otpStep = false),
//           child: Text('Change number', style: fred(13, color: amber)),
//         ),
//       ),
//     ],
//   );
// }

// /* ---------- Home (business switcher) ---------- */

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: store,
//       builder: (context, _) => ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           // header
//           Container(
//             padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [honey, honeyDeep]),
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Namaste 🙏',
//                   style: fred(15, w: FontWeight.w500, color: beeDark),
//                 ),
//                 Text('Aarav', style: fred(26, w: FontWeight.w700)),
//                 const SizedBox(height: 14),
//                 _Press(
//                   onTap: () => HomePage._goTab(context, 2),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 18,
//                       vertical: 14,
//                     ),
//                     decoration: BoxDecoration(
//                       color: beeDark,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: [
//                         const Bob(
//                           dy: 4,
//                           child: Text('🍯', style: TextStyle(fontSize: 32)),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.baseline,
//                                 textBaseline: TextBaseline.alphabetic,
//                                 children: [
//                                   Text(
//                                     '${store.honeyDrops}',
//                                     style: fred(
//                                       26,
//                                       w: FontWeight.w700,
//                                       color: honey,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 6),
//                                   Text(
//                                     'Honey Drops',
//                                     style: fred(13, color: honey),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 'Your Moury-wide reward balance',
//                                 style: fred(
//                                   11,
//                                   w: FontWeight.w500,
//                                   color: cream2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           sectionTitle(
//             '🏪 Your places',
//             trailing: const _LinkText('Add more', tab: 1),
//           ),
//           SizedBox(
//             height: 132,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.fromLTRB(22, 12, 22, 6),
//               children: [
//                 for (final b in store.businesses) _bizCard(context, b),
//                 _addCard(context),
//               ],
//             ),
//           ),

//           sectionTitle('⚡ Quick actions'),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               mainAxisSpacing: 12,
//               crossAxisSpacing: 12,
//               childAspectRatio: 2.6,
//               children: [
//                 _qa(
//                   '📲',
//                   'My QR',
//                   'Earn at checkout',
//                   () => Navigator.push(context, _slideUp(const MyQrScreen())),
//                 ),
//                 _qa(
//                   '📷',
//                   'Scan',
//                   'Join a shop',
//                   () => Navigator.push(
//                     context,
//                     _slideUp(const ScanScreen(mode: 'customer')),
//                   ),
//                 ),
//                 _qa('📍', 'Nearby', 'Find shops', () => _goTab(context, 1)),
//                 _qa(
//                   '🕑',
//                   'History',
//                   'Points & rewards',
//                   () =>
//                       Navigator.push(context, _slideUp(const HistoryScreen())),
//                 ),
//               ],
//             ),
//           ),

//           sectionTitle('🔥 Almost there!'),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
//             child: _Press(
//               onTap: () => Navigator.push(
//                 context,
//                 _slideUp(BizDetailScreen(store.businesses[0])),
//               ),
//               child: AppCard(
//                 child: Row(
//                   children: [
//                     const Text('☕', style: TextStyle(fontSize: 34)),
//                     const SizedBox(width: 14),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Honeycomb Café',
//                             style: fred(15, w: FontWeight.w600),
//                           ),
//                           const SizedBox(height: 8),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(99),
//                             child: LinearProgressIndicator(
//                               value:
//                                   store.businesses[0].punch /
//                                   store.businesses[0].punchMax,
//                               minHeight: 9,
//                               backgroundColor: cream2,
//                               valueColor: const AlwaysStoppedAnimation(
//                                 honeyDeep,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             '${store.businesses[0].punchMax - store.businesses[0].punch} more stamp(s) = free coffee! ☕',
//                             style: nun(11),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _bizCard(BuildContext context, Business b) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 14),
//       child: _Press(
//         onTap: () => Navigator.push(context, _slideUp(BizDetailScreen(b))),
//         child: Container(
//           width: 150,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [b.brand, b.deep],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(22),
//             boxShadow: [
//               BoxShadow(
//                 color: b.deep.withOpacity(0.35),
//                 blurRadius: 16,
//                 offset: const Offset(0, 8),
//               ),
//             ],
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: -20,
//                 bottom: -20,
//                 child: Container(
//                   width: 90,
//                   height: 90,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.15),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(b.emoji, style: const TextStyle(fontSize: 36)),
//                   const SizedBox(height: 8),
//                   Text(
//                     b.name,
//                     style: fred(16, w: FontWeight.w700, color: b.ink),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     b.type == 'punch'
//                         ? '⭕ ${b.punch}/${b.punchMax} stamps'
//                         : '🍯 ${b.pts} points',
//                     style: fred(12, w: FontWeight.w500, color: b.ink),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _addCard(BuildContext context) => _Press(
//     onTap: () => _goTab(context, 1),
//     child: Container(
//       width: 116,
//       decoration: BoxDecoration(
//         color: honeyDeep.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: amber, width: 2.4, style: BorderStyle.solid),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             '+',
//             style: fred(34, w: FontWeight.w600, color: amber),
//           ),
//           Text(
//             'Add shop',
//             style: fred(13, w: FontWeight.w600, color: amber),
//           ),
//         ],
//       ),
//     ),
//   );

//   Widget _qa(String icon, String t, String s, VoidCallback onTap) => _Press(
//     onTap: onTap,
//     child: AppCard(
//       padding: const EdgeInsets.all(14),
//       child: Row(
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(
//               color: cream2,
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Center(
//               child: Text(icon, style: const TextStyle(fontSize: 22)),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(t, style: fred(15, w: FontWeight.w600)),
//                 Text(s, style: nun(11)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   static void _goTab(BuildContext context, int i) {
//     final st = context.findAncestorStateOfType<_CustomerShellState>();
//     st?.goTab(i);
//   }
// }

// class _LinkText extends StatelessWidget {
//   final String text;
//   final int tab;
//   const _LinkText(this.text, {required this.tab});
//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: () => HomePage._goTab(context, tab),
//     child: Text(
//       text,
//       style: fred(13, w: FontWeight.w600, color: amber),
//     ),
//   );
// }

// /* ---------- Business detail (themed) ---------- */

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
//             // hero
//             Container(
//               padding: const EdgeInsets.fromLTRB(22, 24, 22, 26),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [b.brand, b.deep],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: const BorderRadius.vertical(
//                   bottom: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _circleBtn(
//                         Icons.arrow_back,
//                         () => Navigator.pop(context),
//                       ),
//                       _circleBtn(
//                         Icons.info_outline,
//                         () => showBeeToast(context, 'ℹ️ Shop info'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 14),
//                   Row(
//                     children: [
//                       Container(
//                         width: 62,
//                         height: 62,
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.22),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Center(
//                           child: Text(
//                             b.emoji,
//                             style: const TextStyle(fontSize: 34),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             b.name,
//                             style: fred(24, w: FontWeight.w700, color: b.ink),
//                           ),
//                           Text(
//                             b.tagline,
//                             style: fred(
//                               13,
//                               w: FontWeight.w500,
//                               color: b.ink.withOpacity(0.85),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 18),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         b.type == 'punch'
//                             ? '${b.punch}/${b.punchMax}'
//                             : '${b.pts}',
//                         style: fred(50, w: FontWeight.w700, color: b.ink),
//                       ),
//                       const SizedBox(width: 8),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           b.type == 'punch' ? 'stamps' : 'points',
//                           style: fred(
//                             16,
//                             w: FontWeight.w600,
//                             color: b.ink.withOpacity(0.9),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.18),
//                       borderRadius: BorderRadius.circular(99),
//                     ),
//                     child: Text(
//                       '${b.tier == "Gold"
//                           ? "🥇"
//                           : b.tier == "Silver"
//                           ? "🥈"
//                           : "🥉"} ${b.tier} member',
//                       style: fred(12, w: FontWeight.w600, color: b.ink),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             if (b.type == 'punch') ...[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
//                 child: Text(
//                   '⭕ Punch card',
//                   style: fred(15, w: FontWeight.w600),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(22, 6, 22, 0),
//                 child: AppCard(
//                   child: Column(
//                     children: [
//                       Wrap(
//                         spacing: 10,
//                         runSpacing: 10,
//                         children: List.generate(
//                           b.punchMax,
//                           (i) => _stamp(b, i),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           '${b.punchMax - b.punch} more to your free reward! 🎉',
//                           style: nun(12),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],

//             sectionTitle('🎁 Rewards'),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: Column(
//                 children: [
//                   for (final r in b.rewards)
//                     RewardTile(reward: r, accent: b.brand),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 14, 22, 0),
//               child: BeeButton(
//                 '📲 Show my QR to earn here',
//                 onTap: () =>
//                     Navigator.push(context, _slideUp(const MyQrScreen())),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(22, 14, 22, 30),
//               child: Text(
//                 "This is ${b.name}'s very own loyalty space — powered quietly by Moury. 🐝",
//                 textAlign: TextAlign.center,
//                 style: nun(12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _stamp(Business b, int i) {
//     final size = (320 - 22 * 2 - 18 - 10 * 4) / 5; // approx 5 per row
//     final on = i < b.punch;
//     final isFree = i == b.punchMax - 1 && !on;
//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: on ? 0 : 1, end: 1),
//       duration: Duration(milliseconds: 300 + i * 40),
//       curve: Curves.elasticOut,
//       builder: (_, v, child) =>
//           Transform.scale(scale: on ? v : 1, child: child),
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: on ? LinearGradient(colors: [b.brand, b.deep]) : null,
//           color: on ? null : cream,
//           border: on
//               ? null
//               : Border.all(
//                   color: isFree ? b.brand : const Color(0xFFCDB98E),
//                   width: 2.4,
//                 ),
//         ),
//         child: Center(
//           child: Text(
//             isFree ? 'FREE' : b.emoji,
//             style: fred(
//               isFree ? 11 : 18,
//               w: FontWeight.w700,
//               color: on
//                   ? Colors.white
//                   : (isFree ? b.brand : const Color(0xFFCDB98E)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _circleBtn(IconData icon, VoidCallback onTap) => GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.22),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(icon, color: Colors.white, size: 20),
//     ),
//   );
// }

// class RewardTile extends StatefulWidget {
//   final Reward reward;
//   final Color accent;
//   const RewardTile({super.key, required this.reward, required this.accent});
//   @override
//   State<RewardTile> createState() => _RewardTileState();
// }

// class _RewardTileState extends State<RewardTile> {
//   @override
//   Widget build(BuildContext context) {
//     final r = widget.reward;
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       child: AppCard(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           children: [
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: cream2,
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: Center(
//                 child: Text(r.icon, style: const TextStyle(fontSize: 26)),
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(r.title, style: fred(15, w: FontWeight.w600)),
//                   Text(r.sub, style: nun(12)),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   '🎯 ${r.cost}',
//                   style: fred(13, w: FontWeight.w700, color: amber),
//                 ),
//                 const SizedBox(height: 6),
//                 _Press(
//                   onTap: () {
//                     if (r.locked || r.redeemed) return;
//                     setState(() => r.redeemed = true);
//                     showConfetti(context);
//                     showBeeToast(context, '🎁 Redeemed: ${r.title}!');
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 14,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: r.locked
//                           ? cream2
//                           : (r.redeemed ? good : widget.accent),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       r.locked ? 'Locked' : (r.redeemed ? '✓ Done' : 'Redeem'),
//                       style: fred(
//                         13,
//                         w: FontWeight.w600,
//                         color: r.locked
//                             ? const Color(0xFFBBAA99)
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------- My QR ---------- */

// class MyQrScreen extends StatelessWidget {
//   const MyQrScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cream,
//       appBar: AppBar(
//         backgroundColor: cream,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: beeDark),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 22),
//         children: [
//           Center(
//             child: Text('Show to earn 🍯', style: fred(26, w: FontWeight.w700)),
//           ),
//           Center(
//             child: Text(
//               'Let the shop scan this after you pay',
//               style: fred(14, w: FontWeight.w500, color: beeSoft),
//             ),
//           ),
//           const SizedBox(height: 24),
//           Center(
//             child: Container(
//               padding: const EdgeInsets.all(26),
//               decoration: BoxDecoration(
//                 color: white,
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: honey, width: 3),
//                 boxShadow: [
//                   BoxShadow(
//                     color: beeDark.withOpacity(0.18),
//                     blurRadius: 30,
//                     offset: const Offset(0, 14),
//                   ),
//                 ],
//               ),
//               child: QrImageView(
//                 data: 'moury://customer/MRY-7F3K9',
//                 version: QrVersions.auto,
//                 size: 200,
//                 eyeStyle: const QrEyeStyle(
//                   eyeShape: QrEyeShape.square,
//                   color: beeDark,
//                 ),
//                 dataModuleStyle: const QrDataModuleStyle(
//                   dataModuleShape: QrDataModuleShape.square,
//                   color: beeDark,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 18),
//           Center(
//             child: Text('Aarav Sharma', style: fred(20, w: FontWeight.w700)),
//           ),
//           Center(
//             child: Text(
//               'Moury ID · MRY-7F3K9 · +977 98••••321',
//               style: fred(13, w: FontWeight.w500, color: beeSoft),
//             ),
//           ),
//           const SizedBox(height: 24),
//           Row(
//             children: [
//               Expanded(
//                 child: BeeButton(
//                   'Share',
//                   variant: 'ghost',
//                   onTap: () => showBeeToast(context, '🔗 QR link copied!'),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: BeeButton(
//                   'Demo earn',
//                   variant: 'primary',
//                   icon: Icons.play_arrow,
//                   onTap: () {
//                     store.earnAtHoneycomb();
//                     showConfetti(context);
//                     showBeeToast(
//                       context,
//                       '🍯 +50 points & 1 stamp at Honeycomb Café!',
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Same QR works at every Moury shop. The shop credits points or punches your card instantly.',
//             textAlign: TextAlign.center,
//             style: nun(12),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ---------- Discover ---------- */

// class DiscoverPage extends StatelessWidget {
//   const DiscoverPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: store,
//       builder: (context, _) => ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [honey, honeyDeep]),
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Discover & join',
//                   style: fred(13, w: FontWeight.w500, color: beeDark),
//                 ),
//                 Text('Shops near you 📍', style: fred(24, w: FontWeight.w700)),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: AppCard(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               child: Row(
//                 children: [
//                   const Icon(Icons.search, color: beeSoft),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: TextField(
//                       style: fred(15, w: FontWeight.w500),
//                       decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Search cafés, restaurants, shops...',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 36,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               children: [
//                 _pill('All', active: true),
//                 _pill('☕ Cafés'),
//                 _pill('🍜 Restaurants'),
//                 _pill('🧁 Bakeries'),
//                 _pill('💈 Salons'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           for (int i = 0; i < store.discover.length; i++) _shop(context, i),
//           Padding(
//             padding: const EdgeInsets.all(22),
//             child: Text(
//               'Joining shares your name & number with the shop so they can reward you. You can leave anytime. 🔒',
//               textAlign: TextAlign.center,
//               style: nun(12),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _pill(String t, {bool active = false}) => Container(
//     margin: const EdgeInsets.only(right: 8),
//     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     decoration: BoxDecoration(
//       color: active ? beeDark : cream2,
//       borderRadius: BorderRadius.circular(99),
//     ),
//     child: Text(
//       t,
//       style: fred(11, w: FontWeight.w600, color: active ? honey : beeSoft),
//     ),
//   );

//   Widget _shop(BuildContext context, int i) {
//     final s = store.discover[i];
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
//       child: AppCard(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           children: [
//             Container(
//               width: 54,
//               height: 54,
//               decoration: BoxDecoration(
//                 color: s.brand.withOpacity(0.13),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Center(
//                 child: Text(s.emoji, style: const TextStyle(fontSize: 28)),
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(s.name, style: fred(16, w: FontWeight.w600)),
//                   Text('${s.dist} · ⭐ 4.${5 + i % 4}', style: nun(12)),
//                 ],
//               ),
//             ),
//             _Press(
//               onTap: () {
//                 if (s.joined) return;
//                 store.joinShop(i);
//                 showConfetti(context);
//                 showBeeToast(
//                   context,
//                   '🎉 Joined ${s.name}! +20 🍯 welcome bonus',
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 14,
//                   vertical: 8,
//                 ),
//                 decoration: BoxDecoration(
//                   color: s.joined ? good : honey,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   s.joined ? '✓ Joined' : 'Join',
//                   style: fred(
//                     13,
//                     w: FontWeight.w600,
//                     color: s.joined ? Colors.white : beeDark,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------- Honey Drops ---------- */

// class HoneyPage extends StatelessWidget {
//   const HoneyPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: store,
//       builder: (context, _) => ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFFFFD56B), honeyDeep],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//             ),
//             child: Column(
//               children: [
//                 const Bob(
//                   dy: 5,
//                   child: Text('🍯', style: TextStyle(fontSize: 64)),
//                 ),
//                 Text(
//                   '${store.honeyDrops}',
//                   style: fred(46, w: FontWeight.w700, color: beeDark),
//                 ),
//                 Text(
//                   'Honey Drops · Moury rewards',
//                   style: fred(15, w: FontWeight.w500, color: beeDark),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Text(
//               'Earn Honey Drops everywhere you shop on Moury. Spend them on rewards from any partner.',
//               textAlign: TextAlign.center,
//               style: nun(12),
//             ),
//           ),
//           sectionTitle('🎁 Redeem your drops'),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: Column(
//               children: [
//                 _honeyReward(
//                   context,
//                   '🎟️',
//                   'Rs 100 off any partner',
//                   'Use at checkout anywhere',
//                   500,
//                 ),
//                 _honeyReward(
//                   context,
//                   '☕',
//                   'Free drink voucher',
//                   'Top partner cafés',
//                   800,
//                 ),
//                 _honeyReward(
//                   context,
//                   '🎬',
//                   'Movie ticket',
//                   'QFX / Big Movies',
//                   2000,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _honeyReward(
//     BuildContext context,
//     String icon,
//     String t,
//     String s,
//     int cost,
//   ) {
//     final affordable = store.honeyDrops >= cost;
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       child: AppCard(
//         padding: const EdgeInsets.all(14),
//         child: Row(
//           children: [
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: cream2,
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: Center(
//                 child: Text(icon, style: const TextStyle(fontSize: 26)),
//               ),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(t, style: fred(15, w: FontWeight.w600)),
//                   Text(s, style: nun(12)),
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   '🍯 $cost',
//                   style: fred(13, w: FontWeight.w700, color: amber),
//                 ),
//                 const SizedBox(height: 6),
//                 _Press(
//                   onTap: () {
//                     if (!affordable) {
//                       showBeeToast(context, '🍯 Not enough Honey Drops yet');
//                       return;
//                     }
//                     if (store.redeemHoney(cost)) {
//                       showConfetti(context);
//                       showBeeToast(
//                         context,
//                         '🎟️ Reward unlocked! Check your wallet',
//                       );
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 14,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: affordable ? honeyDeep : cream2,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       affordable ? 'Redeem' : 'Locked',
//                       style: fred(
//                         13,
//                         w: FontWeight.w600,
//                         color: affordable
//                             ? Colors.white
//                             : const Color(0xFFBBAA99),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------- History ---------- */

// class HistoryScreen extends StatelessWidget {
//   const HistoryScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cream,
//       appBar: AppBar(
//         backgroundColor: honeyDeep,
//         elevation: 0,
//         title: Text('Activity 🕑', style: fred(22, w: FontWeight.w700)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: beeDark),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 18),
//         children: [
//           for (int i = 0; i < store.history.length; i++)
//             _row(store.history[i], i == store.history.length - 1),
//         ],
//       ),
//     );
//   }

//   Widget _row(HistoryItem h, bool last) => IntrinsicHeight(
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         const SizedBox(width: 22),
//         Column(
//           children: [
//             const SizedBox(height: 18),
//             Container(
//               width: 14,
//               height: 14,
//               decoration: BoxDecoration(
//                 color: honey,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: beeDark, width: 3),
//               ),
//             ),
//             if (!last) Expanded(child: Container(width: 2, color: cream2)),
//           ],
//         ),
//         const SizedBox(width: 14),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 6, 22, 12),
//             child: AppCard(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
//               child: Row(
//                 children: [
//                   Text(h.emoji, style: const TextStyle(fontSize: 22)),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(h.title, style: fred(14, w: FontWeight.w600)),
//                         Text(h.sub, style: nun(11)),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     h.value,
//                     style: fred(
//                       15,
//                       w: FontWeight.w700,
//                       color: h.kind == 'plus' ? good : pink,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// /* ---------- Profile ---------- */

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [honey, amber]),
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Column(
//             children: [
//               const Bob(
//                 child: CircleAvatar(
//                   radius: 42,
//                   backgroundColor: beeDark,
//                   child: Text('🐝', style: TextStyle(fontSize: 40)),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'Aarav Sharma',
//                 style: fred(24, w: FontWeight.w700, color: Colors.white),
//               ),
//               Text(
//                 '+977 98••••321 · member since 2024',
//                 style: fred(13, w: FontWeight.w500, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(22),
//           child: Row(
//             children: [
//               _stat('5', 'Shops joined'),
//               const SizedBox(width: 12),
//               _stat('${store.honeyDrops}', 'Honey Drops'),
//               const SizedBox(width: 12),
//               _stat('23', 'Rewards used'),
//             ],
//           ),
//         ),
//         _menu(
//           context,
//           '📲',
//           'My Moury QR',
//           () => Navigator.push(context, _slideUp(const MyQrScreen())),
//         ),
//         _menu(
//           context,
//           '🧾',
//           'Redemption history',
//           () => Navigator.push(context, _slideUp(const HistoryScreen())),
//         ),
//         _menuToggle('🔔', 'Notifications', true),
//         _menuToggle('📍', 'Location for nearby shops', true),
//         _menu(context, '🔒', 'Privacy & data sharing', () {}),
//         _menu(context, '❓', 'Help & support', () {}),
//         const SizedBox(height: 30),
//       ],
//     );
//   }

//   Widget _stat(String n, String l) => Expanded(
//     child: AppCard(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Column(
//         children: [
//           Text(
//             n,
//             style: fred(22, w: FontWeight.w700, color: amber),
//           ),
//           Text(l, style: nun(11)),
//         ],
//       ),
//     ),
//   );

//   Widget _menu(
//     BuildContext context,
//     String icon,
//     String t,
//     VoidCallback onTap,
//   ) => InkWell(
//     onTap: onTap,
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: amber.withOpacity(0.08))),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 42,
//             height: 42,
//             decoration: BoxDecoration(
//               color: cream2,
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Center(
//               child: Text(icon, style: const TextStyle(fontSize: 20)),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Text(t, style: fred(15, w: FontWeight.w600)),
//           ),
//           const Icon(Icons.chevron_right, color: beeSoft),
//         ],
//       ),
//     ),
//   );

//   Widget _menuToggle(String icon, String t, bool on) =>
//       _MenuToggleTile(icon: icon, title: t, initial: on);
// }

// class _MenuToggleTile extends StatefulWidget {
//   final String icon, title;
//   final bool initial;
//   const _MenuToggleTile({
//     required this.icon,
//     required this.title,
//     required this.initial,
//   });
//   @override
//   State<_MenuToggleTile> createState() => _MenuToggleTileState();
// }

// class _MenuToggleTileState extends State<_MenuToggleTile> {
//   late bool on = widget.initial;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: amber.withOpacity(0.08))),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 42,
//             height: 42,
//             decoration: BoxDecoration(
//               color: cream2,
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Center(
//               child: Text(widget.icon, style: const TextStyle(fontSize: 20)),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Text(widget.title, style: fred(15, w: FontWeight.w600)),
//           ),
//           GestureDetector(
//             onTap: () => setState(() => on = !on),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 220),
//               width: 48,
//               height: 28,
//               decoration: BoxDecoration(
//                 color: on ? good : cream2,
//                 borderRadius: BorderRadius.circular(99),
//               ),
//               child: AnimatedAlign(
//                 duration: const Duration(milliseconds: 220),
//                 alignment: on ? Alignment.centerRight : Alignment.centerLeft,
//                 child: Container(
//                   width: 22,
//                   height: 22,
//                   margin: const EdgeInsets.all(3),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* ---------- Scan (shared) ---------- */

// class ScanScreen extends StatefulWidget {
//   final String mode; // customer | business
//   const ScanScreen({super.key, required this.mode});
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController line = AnimationController(
//     vsync: this,
//     duration: const Duration(milliseconds: 1800),
//   )..repeat(reverse: true);
//   String hint = 'Hold steady...';

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 1600), () {
//       if (!mounted) return;
//       setState(() => hint = '✓ QR detected!');
//       Future.delayed(const Duration(milliseconds: 700), () {
//         if (!mounted) return;
//         if (widget.mode == 'business') {
//           Navigator.pushReplacement(context, _slideUp(const CreditScreen()));
//         } else {
//           final root = Navigator.of(context, rootNavigator: true).context;
//           Navigator.pop(context);
//           store.notifyListeners();
//           showConfetti(root);
//           showBeeToast(root, '✅ Joined the shop! Tap it to see rewards');
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     line.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xF2140E06),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: 8,
//               left: 18,
//               child: IconButton(
//                 icon: const Icon(Icons.close, color: Colors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.mode == 'business'
//                         ? 'Scan the customer QR 👤'
//                         : 'Point at a shop QR 🐝',
//                     style: fred(18, w: FontWeight.w600, color: Colors.white),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 230,
//                     height: 230,
//                     child: Stack(
//                       children: [
//                         _corner(Alignment.topLeft),
//                         _corner(Alignment.topRight),
//                         _corner(Alignment.bottomLeft),
//                         _corner(Alignment.bottomRight),
//                         AnimatedBuilder(
//                           animation: line,
//                           builder: (_, __) => Positioned(
//                             top: 14 + line.value * 198,
//                             left: 10,
//                             right: 10,
//                             child: Container(
//                               height: 3,
//                               decoration: BoxDecoration(
//                                 color: honey,
//                                 borderRadius: BorderRadius.circular(2),
//                                 boxShadow: [
//                                   BoxShadow(color: honey, blurRadius: 16),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Text(hint, style: nun(13, color: Colors.white70)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _corner(Alignment a) {
//     final left = a.x < 0, top = a.y < 0;
//     return Align(
//       alignment: a,
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           border: Border(
//             left: left
//                 ? const BorderSide(color: honey, width: 4)
//                 : BorderSide.none,
//             right: !left
//                 ? const BorderSide(color: honey, width: 4)
//                 : BorderSide.none,
//             top: top
//                 ? const BorderSide(color: honey, width: 4)
//                 : BorderSide.none,
//             bottom: !top
//                 ? const BorderSide(color: honey, width: 4)
//                 : BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

// /* ============================ BUSINESS APP ============================ */

// class BusinessShell extends StatefulWidget {
//   const BusinessShell({super.key});
//   @override
//   State<BusinessShell> createState() => _BusinessShellState();
// }

// class _BusinessShellState extends State<BusinessShell> {
//   int nav = 0;
//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       const BDashPage(),
//       const BMembersPage(),
//       const BRewardsPage(),
//       const BSettingsPage(),
//     ];
//     return Scaffold(
//       backgroundColor: cream,
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 350),
//         child: KeyedSubtree(key: ValueKey(nav), child: pages[nav]),
//       ),
//       bottomNavigationBar: BeeBottomBar(
//         current: nav,
//         items: const [
//           BarItem('📊', 'Dash'),
//           BarItem('👥', 'Members'),
//           BarItem('🎁', 'Rewards'),
//           BarItem('⚙️', 'Shop'),
//         ],
//         onTap: (i) => setState(() => nav = i),
//         fabIcon: '📷',
//         onFab: () => Navigator.push(
//           context,
//           _slideUp(const ScanScreen(mode: 'business')),
//         ),
//       ),
//     );
//   }
// }

// class BDashPage extends StatelessWidget {
//   const BDashPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(22, 24, 22, 44),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [beeDark, beeSoft]),
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Good morning ☀️',
//                 style: fred(14, w: FontWeight.w500, color: Colors.white70),
//               ),
//               Text(
//                 '☕ Honeycomb Café',
//                 style: fred(24, w: FontWeight.w700, color: honey),
//               ),
//             ],
//           ),
//         ),
//         Transform.translate(
//           offset: const Offset(0, -30),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 22),
//             child: Row(
//               children: [
//                 _kpi('142', 'Members'),
//                 const SizedBox(width: 12),
//                 _kpi('28', "Today's visits"),
//                 const SizedBox(width: 12),
//                 _kpi('9', 'Rewards given'),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
//           child: _Press(
//             onTap: () => Navigator.push(
//               context,
//               _slideUp(const ScanScreen(mode: 'business')),
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(colors: [honey, honeyDeep]),
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(
//                     color: honeyDeep.withOpacity(0.5),
//                     blurRadius: 24,
//                     offset: const Offset(0, 12),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   const Text('📷', style: TextStyle(fontSize: 50)),
//                   Text('Scan customer QR', style: fred(20, w: FontWeight.w700)),
//                   Text(
//                     'Credit points or punch a card',
//                     style: fred(13, w: FontWeight.w500, color: beeDark),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         sectionTitle('👥 Recent customers'),
//         _cust('🧑', 'Aarav Sharma', '2 min ago · +50 pts', '450 🍯'),
//         _cust('👩', 'Sita Gurung', '18 min ago · card punched', '8/10'),
//         _cust('🧔', 'Bikash Rai', '1 hr ago · redeemed coffee', '120 🍯'),
//         const SizedBox(height: 20),
//       ],
//     );
//   }

//   Widget _kpi(String k, String l) => Expanded(
//     child: AppCard(
//       padding: const EdgeInsets.all(14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             k,
//             style: fred(22, w: FontWeight.w700, color: amber),
//           ),
//           Text(l, style: nun(11)),
//         ],
//       ),
//     ),
//   );
// }

// Widget _cust(String av, String n, String sub, String val) => Container(
//   padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
//   decoration: BoxDecoration(
//     border: Border(bottom: BorderSide(color: amber.withOpacity(0.08))),
//   ),
//   child: Row(
//     children: [
//       CircleAvatar(
//         radius: 22,
//         backgroundColor: cream2,
//         child: Text(av, style: const TextStyle(fontSize: 20)),
//       ),
//       const SizedBox(width: 14),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(n, style: fred(15, w: FontWeight.w600)),
//             Text(sub, style: nun(12)),
//           ],
//         ),
//       ),
//       Text(
//         val,
//         style: fred(15, w: FontWeight.w700, color: amber),
//       ),
//     ],
//   ),
// );

// class BMembersPage extends StatelessWidget {
//   const BMembersPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [beeDark, beeSoft]),
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Text(
//             '👥 Members',
//             style: fred(22, w: FontWeight.w700, color: honey),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: AppCard(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//             child: Row(
//               children: [
//                 const Icon(Icons.search, color: beeSoft),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextField(
//                     style: fred(15, w: FontWeight.w500),
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Search members...',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         _cust('🧑', 'Aarav Sharma', 'Gold · 14 visits', '450 🍯'),
//         _cust('👩', 'Sita Gurung', 'Silver · 8 visits', '8/10'),
//         _cust('🧔', 'Bikash Rai', 'Gold · 21 visits', '120 🍯'),
//         _cust('👧', 'Priya Thapa', 'Bronze · 3 visits', '60 🍯'),
//         _cust('👨', 'Rajesh KC', 'Silver · 11 visits', '230 🍯'),
//       ],
//     );
//   }
// }

// class BRewardsPage extends StatelessWidget {
//   const BRewardsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(22, 24, 22, 18),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [beeDark, beeSoft]),
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Text(
//             '🎁 Your rewards',
//             style: fred(22, w: FontWeight.w700, color: honey),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(18),
//           child: AppCard(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Loyalty type', style: fred(15, w: FontWeight.w600)),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(child: BeeButton('🎯 Points', onTap: () {})),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: BeeButton(
//                         '⭕ Punch card',
//                         variant: 'ghost',
//                         onTap: () {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Customers earn points per Rs spent, or collect punches per visit.',
//                   style: nun(12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(22, 0, 22, 10),
//           child: Text('Reward menu', style: fred(15, w: FontWeight.w600)),
//         ),
//         _rewardToggle('☕', 'Free coffee', 'After 10 punches', true),
//         _rewardToggle('🧁', 'Free muffin', '300 points', true),
//         _rewardToggle('🎂', 'Birthday treat', 'Auto every year', false),
//         Padding(
//           padding: const EdgeInsets.all(22),
//           child: BeeButton('➕ Add reward', variant: 'primary', onTap: () {}),
//         ),
//       ],
//     );
//   }

//   Widget _rewardToggle(String icon, String t, String s, bool on) => Padding(
//     padding: const EdgeInsets.fromLTRB(22, 0, 22, 10),
//     child: AppCard(
//       padding: const EdgeInsets.all(14),
//       child: Row(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: cream2,
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Center(
//               child: Text(icon, style: const TextStyle(fontSize: 26)),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(t, style: fred(15, w: FontWeight.w600)),
//                 Text(s, style: nun(12)),
//               ],
//             ),
//           ),
//           _MiniToggle(initial: on),
//         ],
//       ),
//     ),
//   );
// }

// class _MiniToggle extends StatefulWidget {
//   final bool initial;
//   const _MiniToggle({required this.initial});
//   @override
//   State<_MiniToggle> createState() => _MiniToggleState();
// }

// class _MiniToggleState extends State<_MiniToggle> {
//   late bool on = widget.initial;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => setState(() => on = !on),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 220),
//         width: 48,
//         height: 28,
//         decoration: BoxDecoration(
//           color: on ? good : cream2,
//           borderRadius: BorderRadius.circular(99),
//         ),
//         child: AnimatedAlign(
//           duration: const Duration(milliseconds: 220),
//           alignment: on ? Alignment.centerRight : Alignment.centerLeft,
//           child: Container(
//             width: 22,
//             height: 22,
//             margin: const EdgeInsets.all(3),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BSettingsPage extends StatelessWidget {
//   const BSettingsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         Container(
//           padding: const EdgeInsets.fromLTRB(22, 28, 22, 26),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [beeDark, beeSoft]),
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//           ),
//           child: Column(
//             children: [
//               const Bob(
//                 child: CircleAvatar(
//                   radius: 42,
//                   backgroundColor: honey,
//                   child: Text('☕', style: TextStyle(fontSize: 38)),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'Honeycomb Café',
//                 style: fred(24, w: FontWeight.w700, color: honey),
//               ),
//               Text(
//                 'Thamel, Kathmandu · Joined 2024',
//                 style: fred(13, w: FontWeight.w500, color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(22),
//           child: Row(
//             children: [
//               _stat('142', 'Members'),
//               const SizedBox(width: 12),
//               _stat('Rs 84k', 'Driven/mo'),
//               const SizedBox(width: 12),
//               _stat('4.8★', 'Rating'),
//             ],
//           ),
//         ),
//         _m('🏪', 'Business profile & logo'),
//         _m('📍', 'Location & hours'),
//         _m('🎁', 'Rewards & rules'),
//         _m('👨‍🍳', 'Staff & permissions'),
//         _m('📊', 'Reports & analytics'),
//         _m('📣', 'Send a promo blast'),
//         const SizedBox(height: 30),
//       ],
//     );
//   }

//   Widget _stat(String n, String l) => Expanded(
//     child: AppCard(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Column(
//         children: [
//           Text(
//             n,
//             style: fred(20, w: FontWeight.w700, color: amber),
//           ),
//           Text(l, style: nun(11)),
//         ],
//       ),
//     ),
//   );

//   Widget _m(String icon, String t) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//     decoration: BoxDecoration(
//       border: Border(bottom: BorderSide(color: amber.withOpacity(0.08))),
//     ),
//     child: Row(
//       children: [
//         Container(
//           width: 42,
//           height: 42,
//           decoration: BoxDecoration(
//             color: cream2,
//             borderRadius: BorderRadius.circular(13),
//           ),
//           child: Center(
//             child: Text(icon, style: const TextStyle(fontSize: 20)),
//           ),
//         ),
//         const SizedBox(width: 14),
//         Expanded(
//           child: Text(t, style: fred(15, w: FontWeight.w600)),
//         ),
//         const Icon(Icons.chevron_right, color: beeSoft),
//       ],
//     ),
//   );
// }

// /* ---------- Business: credit customer ---------- */

// class CreditScreen extends StatefulWidget {
//   const CreditScreen({super.key});
//   @override
//   State<CreditScreen> createState() => _CreditScreenState();
// }

// class _CreditScreenState extends State<CreditScreen> {
//   int amount = 50;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xF8140E06),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(30),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: white,
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 28,
//                         backgroundColor: cream2,
//                         child: const Text('🧑', style: TextStyle(fontSize: 32)),
//                       ),
//                       const SizedBox(height: 8),
//                       Text('Aarav Sharma', style: fred(20, w: FontWeight.w700)),
//                       Text('Member · 450 Honey Drops', style: nun(12)),
//                       const SizedBox(height: 18),
//                       Text(
//                         'Points to credit',
//                         style: fred(13, w: FontWeight.w600),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _pad(
//                             '−',
//                             () => setState(() => amount = max(0, amount - 10)),
//                           ),
//                           SizedBox(
//                             width: 90,
//                             child: Text(
//                               '$amount',
//                               textAlign: TextAlign.center,
//                               style: fred(48, w: FontWeight.w700, color: amber),
//                             ),
//                           ),
//                           _pad('+', () => setState(() => amount += 10)),
//                         ],
//                       ),
//                       const SizedBox(height: 14),
//                       BeeButton(
//                         '✓ Credit points',
//                         onTap: () {
//                           final root = Navigator.of(
//                             context,
//                             rootNavigator: true,
//                           ).context;
//                           Navigator.pop(context);
//                           showConfetti(root);
//                           showBeeToast(
//                             root,
//                             '✅ Credited $amount points to Aarav!',
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       BeeButton(
//                         '⭕ Punch card instead',
//                         variant: 'ghost',
//                         onTap: () {
//                           final root = Navigator.of(
//                             context,
//                             rootNavigator: true,
//                           ).context;
//                           Navigator.pop(context);
//                           showConfetti(root);
//                           showBeeToast(root, '⭕ Card punched! 9/10 — 1 to go');
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 IconButton(
//                   icon: const Icon(Icons.close, color: Colors.white),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _pad(String s, VoidCallback onTap) => GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: 48,
//       height: 48,
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: const BoxDecoration(color: cream2, shape: BoxShape.circle),
//       child: Center(
//         child: Text(s, style: fred(26, w: FontWeight.w700)),
//       ),
//     ),
//   );
// }
