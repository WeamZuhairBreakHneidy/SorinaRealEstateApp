import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';



class AppTheme {
  static const String primaryFont = 'Cairo';
  static const String secondaryFont = 'Inter';
  static const String thirdFont = 'Playfair Display';
  //static const String arabicFont = 'Cairo';

  // Define light theme
  static ThemeData get lightTheme {

    return ThemeData(
      //new edits


      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.red,
        // new edits
        primaryContainer: Colors.white, 
        onPrimaryContainer: Colors.black,       




      ),
      dividerColor: AppColors.surface,
      scaffoldBackgroundColor: AppColors.primary,
      fontFamily: primaryFont,
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 24.r,  color: AppColors.white),
        headlineMedium: TextStyle(fontSize: 22.r, fontWeight: FontWeight.w600, color: AppColors.white),
        bodyLarge: TextStyle(fontSize: 30.r, color: AppColors.numbersfontcolor),
        bodyMedium: TextStyle(fontSize: 16.r, color: AppColors.secondaryfontcolor),
        titleLarge:TextStyle(fontSize: 23.r, color: AppColors.fontcolor,fontWeight: FontWeight.bold ),
        bodySmall: TextStyle(fontSize: 15.r, color: AppColors.white,fontWeight: FontWeight.w800),

        

        titleMedium:TextStyle(fontSize: 18.r, color: AppColors.fontcolor,fontWeight: FontWeight.w600 ),
        titleSmall: TextStyle(fontSize: 15.r, color: AppColors.secondaryfontcolor,fontWeight: FontWeight.w900),
        // for numbers
        labelLarge: TextStyle(fontSize: 28.r, fontWeight: FontWeight.bold, color: AppColors.numbersfontcolor),
        labelMedium: TextStyle(fontSize: 26.r, fontWeight: FontWeight.bold, color:AppColors.secondaryfontcolor),
        labelSmall: TextStyle(fontSize: 12.r, fontWeight: FontWeight.bold, color: AppColors.fontcolor),

      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        elevation: 2,
        iconTheme: IconThemeData(color: AppColors.surface),
        titleTextStyle: TextStyle(fontSize: 22.r, fontWeight: FontWeight.bold, color: AppColors.surface),
      ),
      // ✅ Custom Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r), // Rounded corners
      ),
      side: BorderSide(
        width: 2.w, // Thicker border
        color: AppColors.black, // Border color
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary; // Fill color when checked
        }
        return Colors.transparent; // Transparent when unchecked
      }),
      checkColor: MaterialStateProperty.all(Colors.black), // Checkmark color
    ),
  
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.responsiveButtonColor,
          foregroundColor: AppColors.fontcolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
          textStyle: TextStyle(fontFamily: primaryFont,fontSize: 16.r, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
      ),
      //new edits
      cardTheme: CardTheme(
      color: Colors.grey[200],
      shadowColor: Colors.black12,
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    //new edits
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[100],
      elevation: 8,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    ),
  
  
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary, width: 2.w)),
        labelStyle: TextStyle(color: AppColors.primary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primary,
        contentTextStyle: TextStyle(color: AppColors.surface),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        titleTextStyle: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold, color: AppColors.primary),
        contentTextStyle: TextStyle(fontSize: 16.r, color: AppColors.primary),
      ),
    );
  }

  // Define dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      fontFamily: primaryFont,
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 32.r, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: TextStyle(fontSize: 28.r, fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 18.r, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16.r, color: AppColors.secondary),
        bodySmall: TextStyle(fontSize: 14.r, color: AppColors.secondary.withOpacity(0.7)),
        labelLarge: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold, color: AppColors.primary),
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          textStyle: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
      ),
      cardTheme: CardTheme(
        color: AppColors.surface.withOpacity(0.1),
        shadowColor: AppColors.primary.withOpacity(0.4),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary, width: 2.w)),
        labelStyle: TextStyle(color: AppColors.primary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primary,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.surface.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        titleTextStyle: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold, color: Colors.white),
        contentTextStyle: TextStyle(fontSize: 16.r, color: Colors.white),
      ),
      
    );
  }
}
