import 'package:flutter/material.dart';
import 'package:toda_app/Features/onboarding/views/first_screen.dart';
import 'package:toda_app/Features/onboarding/views/second_screen.dart';
import 'package:toda_app/Features/onboarding/views/third_screen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController ,
              children: [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
