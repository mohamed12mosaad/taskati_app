import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:taskati_app/core/constants/app_image.dart';
import 'package:taskati_app/core/services/shared_pref.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/themes.dart';
import 'package:taskati_app/feature/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeDateFormatting('ar');
  await SharedPref.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: Platform.isAndroid,
          child: Stack(
            children: [
              Container(
                color: AppColors.whiteColor,
                width: double.infinity,
                height: double.infinity,
              ),
              Image.asset(
                AppImage.background,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              child ?? Container(),
            ],
          ),
        );
      },
      home: SplashScreen(),
    );
  }
}
