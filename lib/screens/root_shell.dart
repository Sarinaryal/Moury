// // import 'package:flutter/material.dart';
// // import 'package:moury/screens/qr/my_qr_screen.dart';
// // import 'package:moury/utils/navigation.dart';
// // import 'package:moury/widgets/common/bee_bottom_bar.dart';
// // import '../core/constants/app_colors.dart';
// // import '../core/theme/app_theme.dart';
// // import '../widgets/shared/mode_toggle.dart';
// // import 'login_screen.dart';
// // import 'home/home_page.dart';
// // import 'discover/discover_page.dart';
// // import 'honey/honey_page.dart';
// // import 'profile/profile_page.dart';
// // import 'business/business_shell.dart';

// // class RootShell extends StatefulWidget {
// //   const RootShell({super.key});

// //   @override
// //   State<RootShell> createState() => _RootShellState();
// // }

// // class _RootShellState extends State<RootShell> {
// //   String mode = 'customer';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: beeDark,
// //       body: SafeArea(
// //         bottom: false,
// //         child: Column(
// //           children: [
// //             Container(
// //               color: beeDark,
// //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //               child: Row(
// //                 children: [
// //                   const Text('🐝', style: TextStyle(fontSize: 22)),
// //                   const SizedBox(width: 8),
// //                   Text('Moury', style: fred(20, w: FontWeight.w700, color: honey)),
// //                   const Spacer(),
// //                   ModeToggle(mode: mode, onChanged: (m) => setState(() => mode = m)),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               child: AnimatedSwitcher(
// //                 duration: const Duration(milliseconds: 350),
// //                 child: mode == 'customer'
// //                     ? const CustomerShell(key: ValueKey('cust'))
// //                     : const BusinessShell(key: ValueKey('biz')),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CustomerShell extends StatefulWidget {
// //   const CustomerShell({super.key});

// //   @override
// //   State<CustomerShell> createState() => _CustomerShellState();
// // }

// // class _CustomerShellState extends State<CustomerShell> {
// //   bool loggedIn = false;
// //   int nav = 0;

// //   void goTab(int i) => setState(() => nav = i);

// //   @override
// //   Widget build(BuildContext context) {
// //     if (!loggedIn) {
// //       return LoginScreen(onDone: () => setState(() => loggedIn = true));
// //     }
// //     final pages = [
// //       const HomePage(),
// //       const DiscoverPage(),
// //       const HoneyPage(),
// //       const ProfilePage(),
// //     ];
// //     return Scaffold(
// //       backgroundColor: cream,
// //       body: AnimatedSwitcher(
// //         duration: const Duration(milliseconds: 350),
// //         child: KeyedSubtree(key: ValueKey(nav), child: pages[nav]),
// //       ),
// //       bottomNavigationBar: BeeBottomBar(
// //         current: nav,
// //         items: const [
// //           BarItem('🏠', 'Home'),
// //           BarItem('🧭', 'Discover'),
// //           BarItem('🍯', 'Drops'),
// //           BarItem('🐝', 'Me'),
// //         ],
// //         onTap: (i) => setState(() => nav = i),
// //         fabIcon: '📲',
// //         onFab: () => Navigator.push(context, slideUp(const MyQrScreen())),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import '../core/constants/app_colors.dart';
// import '../core/theme/app_theme.dart';
// import '../widgets/common/bee_bottom_bar.dart';
// import '../widgets/shared/mode_toggle.dart';
// import '../utils/navigation.dart';
// import 'login_screen.dart';
// import 'home/home_page.dart';
// import 'discover/discover_page.dart';
// import 'honey/honey_page.dart';
// import 'profile/profile_page.dart';
// import 'business/business_shell.dart';
// import 'qr/my_qr_screen.dart';

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
//             Container(
//               color: beeDark,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               child: Row(
//                 children: [
//                   const Text('🐝', style: TextStyle(fontSize: 22)),
//                   const SizedBox(width: 8),
//                   Text('Moury', style: fred(20, w: FontWeight.w700, color: honey)),
//                   const Spacer(),
//                   ModeToggle(mode: mode, onChanged: (m) => setState(() => mode = m)),
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

// // Make the CustomerShellState public by removing underscore
// class CustomerShell extends StatefulWidget {
//   const CustomerShell({super.key});

//   @override
//   CustomerShellState createState() => CustomerShellState();
// }

// class CustomerShellState extends State<CustomerShell> {
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
//         onFab: () => Navigator.push(context, slideUp(const MyQrScreen())),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart';
import '../widgets/common/bee_bottom_bar.dart';
import '../widgets/shared/mode_toggle.dart';
import '../utils/navigation.dart';
import 'login_screen.dart';
import 'home/home_page.dart';
import 'discover/discover_page.dart';
import 'honey/honey_page.dart';
import 'profile/profile_page.dart';
import 'business/business_shell.dart';
import 'qr/my_qr_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  String mode = 'customer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beeDark,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              color: beeDark,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Text('🐝', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Text('Moury', style: fred(20, w: FontWeight.w700, color: honey)),
                  const Spacer(),
                  ModeToggle(mode: mode, onChanged: (m) => setState(() => mode = m)),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: mode == 'customer'
                    ? const CustomerShell(key: ValueKey('cust'))
                    : const BusinessShell(key: ValueKey('biz')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Make this class public (remove underscore)
class CustomerShell extends StatefulWidget {
  const CustomerShell({super.key});

  @override
  CustomerShellState createState() => CustomerShellState();
}

// Make this state public (remove underscore)
class CustomerShellState extends State<CustomerShell> {
  bool loggedIn = false;
  int nav = 0;

  void goTab(int i) => setState(() => nav = i);

  @override
  Widget build(BuildContext context) {
    if (!loggedIn) {
      return LoginScreen(onDone: () => setState(() => loggedIn = true));
    }
    final pages = [
      const HomePage(),
      const DiscoverPage(),
      const HoneyPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: cream,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: KeyedSubtree(key: ValueKey(nav), child: pages[nav]),
      ),
      bottomNavigationBar: BeeBottomBar(
        current: nav,
        items: const [
          BarItem('🏠', 'Home'),
          BarItem('🧭', 'Discover'),
          BarItem('🍯', 'Drops'),
          BarItem('🐝', 'Me'),
        ],
        onTap: (i) => setState(() => nav = i),
        fabIcon: '📲',
        onFab: () => Navigator.push(context, slideUp(const MyQrScreen())),
      ),
    );
  }
}