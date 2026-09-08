import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffF9F9F8),
    splashColor: Color(0xff006065),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xff006065),
        foregroundColor: Color(0xffFFFFFF),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffFFFFFF),
        foregroundColor: Color(0xff006065),
        padding: EdgeInsets.symmetric(horizontal: 34, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color(0xff006065), width: 1),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff006065),
        textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight(600),
          fontFamily: 'Inter',
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Color(0xff006065)),

    appBarTheme: AppBarThemeData(
      backgroundColor: Color(0xffF9F9F8),
      titleTextStyle: TextStyle(
        color: Color(0xff006065),
        fontSize: 24,
        fontWeight: FontWeight(700),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Color(0xff1A1C1C),
        fontSize: 24,
        fontWeight: FontWeight(700),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      titleMedium: TextStyle(
        color: Color(0xff1A1C1C),
        fontSize: 24,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      titleSmall: TextStyle(
        color: Color(0xff006065),
        fontSize: 20,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      bodyLarge: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 12,
        fontWeight: FontWeight(600),
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(400),
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        color: Color(0xff006065),
        fontSize: 12,
        fontWeight: FontWeight(600),
        fontFamily: 'Inter',
      ),
      labelMedium: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(400),
        fontFamily: 'Inter',
      ),
      labelLarge: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 20,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      labelSmall: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(700),
        fontFamily: 'Inter',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff006065),
      unselectedItemColor: Color(0xff3E4949),
      backgroundColor: Color(0xffF9F9F8),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff1A1C1C),
    splashColor: Color(0xff006065),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Color(0xff006065),
        foregroundColor: Color(0xff000000),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff000000),
        foregroundColor: Color(0xff006065),
        padding: EdgeInsets.symmetric(horizontal: 34, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color(0xff006065), width: 1),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff006065),
        textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight(600),
          fontFamily: 'Inter',
        ),
      ),
    ),
    iconTheme: IconThemeData(color: Color(0xff006065)),

    appBarTheme: AppBarThemeData(
      backgroundColor: Color(0xff1A1C1C),
      titleTextStyle: TextStyle(
        color: Color(0xff006065),
        fontSize: 24,
        fontWeight: FontWeight(700),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Color(0xffF9F9F8),
        fontSize: 32,
        fontWeight: FontWeight(700),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      titleMedium: TextStyle(
        color: Color(0xffF9F9F8),
        fontSize: 24,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      titleSmall: TextStyle(
        color: Color(0xff006065),
        fontSize: 20,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      bodyLarge: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 12,
        fontWeight: FontWeight(600),
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(400),
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        color: Color(0xff006065),
        fontSize: 12,
        fontWeight: FontWeight(600),
        fontFamily: 'Inter',
      ),
      labelMedium: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(400),
        fontFamily: 'Inter',
      ),
      labelLarge: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 20,
        fontWeight: FontWeight(600),
        fontFamily: 'Plus_Jakarta_Sans',
      ),
      labelSmall: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(700),
        fontFamily: 'Inter',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff006065),
      unselectedItemColor: Color(0xff3E4949),
      backgroundColor: Color(0xff1A1C1C),
    ),
  );
}
