import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedRecTheme {
  static ThemeData mainTheme() => ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black87,
          ),
        ),
      );
}
