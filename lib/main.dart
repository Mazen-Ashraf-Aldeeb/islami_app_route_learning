import 'package:flutter/material.dart';
import 'package:islami_app/modules/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "islami",
      home: SplashScreen()
    );
  }
}
