import 'package:flutter/material.dart';

import 'package:islami_app/core/Colors/app_colors.dart';

abstract class AppTextStyle {
  static final TextStyle? title = TextStyle(color:AppColors.gold,fontSize: 24,fontWeight: FontWeight.w700);
  static final TextStyle? value = TextStyle(color:AppColors.gold,fontWeight: FontWeight.w700,fontSize: 20);
}