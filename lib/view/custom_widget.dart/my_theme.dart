import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black87,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          surface: const Color.fromARGB(255, 255, 255, 255),
          onSurface: Colors.black,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: const Color.fromARGB(255, 0, 0, 0),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.grey[300]!,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          surface: const Color.fromARGB(255, 0, 0, 0)!,
          onSurface: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
        ),
      );
}
