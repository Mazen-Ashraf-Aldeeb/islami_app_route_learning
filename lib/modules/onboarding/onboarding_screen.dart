import 'package:flutter/material.dart';
import 'package:islami_app/core/Colors/app_colors.dart';
import 'package:islami_app/core/StringsStyle/TextStyle.dart';
import 'package:islami_app/core/constant/onboarding_datal.dart';
import 'package:islami_app/modules/layout/screens/layout_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/logo/home_logo.png"),
              ),
              SizedBox(height: 80,),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
if (value == onboarding.length - 1) {
  Future.delayed(const Duration(seconds: 3), () {
    if (index == onboarding.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutScreen(),
        ),
      );
    }
  });
}
                  },
                  itemCount: onboarding.length,
                  itemBuilder: (context, index) {
                    return Image.asset(onboarding[index],);
                  },
                ),
              ),
              SizedBox(height: 40,),
              Text(titles[index], style: AppTextStyle.title,textAlign: TextAlign.center,),
            SizedBox(height: 45,),
            Text(values[index], style: AppTextStyle.value,textAlign: TextAlign.center,),
              SizedBox(height: 45,),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (index > 0) {
                        setState(() {
                          controller.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                        });
                      }
                    },
                    child: Text(
                      "Back",
                      style: AppTextStyle.value?.copyWith(fontSize: 16),
                    ),
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboarding.length,
                          (i) {
                        final isSelected = i == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: isSelected ? 25 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFFD166)
                                : const Color(0xff707070),
                            borderRadius: BorderRadius.circular(27),
                          ),
                        );
                      },
                    ),
                  ),

                  Spacer(),

                  InkWell(
                    onTap: () {
                      if (index < onboarding.length - 1) {
                        setState(() {
                          controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                        });
                      }
                    },
                    child: Text(
                      "Next",
                      style: AppTextStyle.value?.copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
