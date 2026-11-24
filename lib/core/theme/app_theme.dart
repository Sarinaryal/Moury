import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

TextStyle fred(
  double size, {
  FontWeight w = FontWeight.w600,
  Color color = beeDark,
  double? ls,
}) => GoogleFonts.fredoka(
  fontSize: size,
  fontWeight: w,
  color: color,
  letterSpacing: ls,
);

TextStyle nun(
  double size, {
  FontWeight w = FontWeight.w700,
  Color color = beeSoft,
}) => GoogleFonts.nunito(fontSize: size, fontWeight: w, color: color);