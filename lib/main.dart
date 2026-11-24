import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_colors.dart';
import 'screens/root_shell.dart';

void main() => runApp(const MouryApp());

class MouryApp extends StatelessWidget {
  const MouryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moury',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: honey, primary: honey),
        textTheme: GoogleFonts.nunitoTextTheme(),
        useMaterial3: true,
      ),
      home: const RootShell(),
    );
  }
}