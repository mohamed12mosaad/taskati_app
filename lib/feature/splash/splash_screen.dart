import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/core/constants/app_image.dart';
import 'package:taskati_app/core/constants/functions/navigations.dart';
import 'package:taskati_app/core/styles/colors.dart';
import 'package:taskati_app/core/styles/text_style.dart';
import 'package:taskati_app/feature/complete_profile/page/complete_profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      pushReplacementTo(context, CompleteProfileScreen());
    }
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          spacing: 18,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImage.logoJson),
            Text('Taskati', style: AppTextStyles.headline),
            Text(
              'It’s time to get organized',
              style: AppTextStyles.caption1.copyWith(
                color: AppColors.seconderyColor,
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
