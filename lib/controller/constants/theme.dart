import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 12, 143, 249),
      disabledBackgroundColor:Colors.grey
    )
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
);