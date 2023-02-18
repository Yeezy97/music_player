import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const TextStyle settingsExpTileTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );


LinearGradient customGradientColor = const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[
  Color(0xFFF551F9),
  Color(0xFF5C76FF),
]);

LinearGradient drawerGradientColor = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      //Colors.black,

      Color(0xFF246EE9), // royal blue
      Color(0xFF0C3365),
      //Color(0xFFFF2400), //  scarlet red
      //Colors.grey.shade400
      //Colors.black
      //Colors.white54

      //Colors.white24
    ]
);

LinearGradient settingsGradientColor = const LinearGradient(
  begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors:[
      Color(0xFF131312),
  Color(0xFF898989),
  //Color(0xFFFFFF0),
  //Colors.white54,
]);



LinearGradient vividYellowGradientColor = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.clamp,
    colors:[
      Color(0xFF3F1714),
      Color(0xFF181818),
      //Color(0xFFB01E68), // purple
      //Colors.deepPurpleAccent,
      //Color(0xFFDC3535), // red
      //Color(0xFFCF7E2E),
      //Color(0xFF3E3E3D), // dark grey
      //Color(0xFFFBD77F),
      //Color(0xFFFD6E3E), // darker vivid yellow 2
      //Color(0xFFFE9B3D), // darker vivid yellow
      //Color(0xFFE5A320), // vivid yellow
      //Color(0xFF3E3E3D), // dark grey
      //Color(0xFFFFF601), // yellow
      //Color(0xFF98A6B1), // grey
      //Color(0xFF145364), // dark blue
      //Color(0xFF181818), // black

      //Colors.white54,
    ]);

ThemeData lightTheme = ThemeData(
  scrollbarTheme: const ScrollbarThemeData(
    thumbColor: MaterialStatePropertyAll(Color(0xFFDC5F00)),

  ),
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
  textTheme: GoogleFonts.sourceSansProTextTheme(
    Typography.blackHelsinki,
  ).copyWith(
    displaySmall: const TextStyle(
      color: Colors.black,
      fontSize: 10,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.grey.withOpacity(0.1),
  ),
  primaryColor:  Colors.white,
  secondaryHeaderColor:  Colors.black,
  primaryColorLight: const Color(0xffF5F5F5),
);

ThemeData darkTheme = ThemeData(
  scrollbarTheme: const ScrollbarThemeData(
    thumbColor: MaterialStatePropertyAll(Color(0xFF857F7F)),

  ),
  iconTheme: const IconThemeData(
    color:  Colors.white,
  ),
  textTheme: GoogleFonts.sourceSansProTextTheme(
     Typography.whiteHelsinki,
  ).copyWith(
    displaySmall: const TextStyle(
      color:  Colors.white,
      fontSize: 10,
    )
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.grey.withOpacity(0.1),
  ),
  primaryColor: const Color(0xFF181818),
  secondaryHeaderColor:  Colors.white,
  primaryColorLight:  Colors.black,
);

