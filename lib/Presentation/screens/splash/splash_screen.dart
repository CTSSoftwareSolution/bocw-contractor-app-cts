import 'dart:async';
import 'package:bocw_contractor_app/Presentation/screens/login/login_screen.dart';
import 'package:bocw_contractor_app/utilities/app_color.dart';
import 'package:bocw_contractor_app/utilities/hardcoded_data.dart';
import 'package:bocw_contractor_app/utilities/image_data.dart';
import 'package:bocw_contractor_app/widgets/custom_text.dart';
import 'package:bocw_contractor_app/widgets/image_assets.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAssets(image: workerLogo, fit: BoxFit.fill, scale: 3),
            CustomText(
              text: splashScreenText,
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
