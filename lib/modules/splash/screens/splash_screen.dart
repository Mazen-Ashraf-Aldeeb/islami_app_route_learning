import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/Colors/app_colors.dart';
import 'package:islami_app/modules/layout/screens/layout_screen.dart';
import 'package:islami_app/modules/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return OnboardingScreen();
      },));

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/logo/app_logo.png")),
            Image.asset("assets/logo/route_logo.png",width: 244),
          ],
        ),
      ),
    );
  }
}
