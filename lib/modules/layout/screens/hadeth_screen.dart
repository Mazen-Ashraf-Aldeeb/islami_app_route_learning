import 'package:flutter/material.dart';

import '../../../core/Colors/app_colors.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withValues(alpha: 0.7),
                    AppColors.black,
                  ],
                  end: Alignment.bottomCenter,

                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset("assets/logo/home_logo.png")
                  ],
                ),
              ),
            ),
    );
  }
}
