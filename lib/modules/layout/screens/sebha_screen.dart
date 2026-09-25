import 'package:flutter/material.dart';
import 'package:islami_app/core/StringsStyle/TextStyle.dart';

import '../../../core/Colors/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int index = 0;
  int counter = 1;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  double angle=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sebha_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.black.withValues(alpha: 0.7),
                      AppColors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Image.asset("assets/logo/home_logo.png", width: 291),
                        SizedBox(height: 25),
                        Text(
                          "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                          style: AppTextStyle.title?.copyWith(
                            fontSize: 39,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Transform.translate(
                          offset: Offset(30, 8),
                          child: Image.asset("assets/logo/Mask group.png"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              angle-=2;
                              if (counter < 34) {
                                counter++;
                                if (counter == 34 &&
                                    index < azkar.length - 1) {
                                  index++;
                                  counter = 1;
                                }else if (index == azkar.length - 1 && counter == 34) {
                                  index = 0;
                                  counter = 1;
                                }
                              }
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Transform.rotate(angle: angle,
                              child: Image.asset("assets/logo/SebhaBody 1.png")),
                              Column(
                                children: [
                                  Text(
                                    azkar[index],
                                    style: AppTextStyle.title?.copyWith(
                                      color: AppColors.white,
                                      fontSize: 36,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "$counter",
                                    style: AppTextStyle.title?.copyWith(
                                      color: AppColors.white,
                                      fontSize: 36,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
