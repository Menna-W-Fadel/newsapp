import 'package:flutter/material.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.secondaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryColor,
          ),
          headlineSmall: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          )),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primaryColor,
        iconTheme: IconThemeData(color: AppColors.secondaryColor),
        titleTextStyle:
            TextStyle(fontSize: 22.sp, color: AppColors.secondaryColor),
      ));
}
