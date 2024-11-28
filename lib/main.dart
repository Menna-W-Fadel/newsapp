import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_theme.dart';
import 'package:newsapp/screens/home/home_screen.dart';
import 'package:newsapp/screens/settings/settings_view.dart';
import 'package:newsapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(430, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routes: {
              SplashScreen.routeName: (_) => const SplashScreen(),
              HomeScreen.routeName: (_) => const HomeScreen(),
              SettingsView.routeName: (_) => const SettingsView(),
            });
      },
      child: const HomeScreen(),
    );
  }
}
