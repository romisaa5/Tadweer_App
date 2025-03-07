import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/onboarding/views/onboarding_view.dart';
import 'package:toda_app/Features/onboarding/views/second_screen.dart';
import 'package:toda_app/Features/onboarding/views/third_screen.dart';

abstract class AppRouter {
  static final onboardingscreen1 = 'onboardingscreen1';
  static final onboardingscreen2 = 'onboardingscreen2';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingView(),
    ),
    GoRoute(
      path: onboardingscreen1,
      builder: (context, state) => SecondScreen(),
    ),
     GoRoute(
      path: onboardingscreen2,
      builder: (context, state) => ThirdScreen(),
    ),
  ]);
}
