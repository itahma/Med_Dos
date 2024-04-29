import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:med_dos/core/utils/app_colors.dart';

import '../utils/app_text_style.dart';
ThemeData getAppTheme(){
  return ThemeData(
   primaryColor:AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,

    ),

    textTheme: TextTheme(
      displayLarge: boldStyle(
        color: AppColors.black,
      ),
      displayMedium: regularStyle(),

    ),

    //button Style
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )
  ),
    //text field
      inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    hintStyle:boldStyle(
      color: AppColors.grey,
      fontSize: 16,
    ), 
  ),
  );
}