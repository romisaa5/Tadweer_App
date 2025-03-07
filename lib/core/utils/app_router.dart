import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/login&register/presentation/views/login_view.dart';
import 'package:toda_app/Features/login&register/presentation/views/register_view.dart';
import 'package:toda_app/Features/onboarding/views/first_screen.dart';
import 'package:toda_app/Features/onboarding/views/second_screen.dart';
import 'package:toda_app/Features/onboarding/views/third_screen.dart';
import 'package:toda_app/Features/onboarding/views/welcome_view.dart';

abstract class AppRouter {
    static final firstScreen = '/onboardingscreen1';
  static final thirdScreen = '/onboardingscreen3';
  static final secondScreen = '/onboardingscreen2';
  static final welcomeView = '/welcomeview';
  static final loginView = '/loginview';
  static final registerView = '/registerview';

  static final router = GoRouter(
    initialLocation: firstScreen,
    routes: [
      GoRoute(
        path: firstScreen,
        builder: (context, state) => FirstScreen(),
      ),
      GoRoute(
        path: secondScreen,
        builder: (context, state) => SecondScreen(),
      ),
      GoRoute(
        path: thirdScreen,
        builder: (context, state) => ThirdScreen(),
      ),
      GoRoute(
        path: welcomeView,
        builder: (context, state) => WelcomeView(),
      ),
      GoRoute(
        path: loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: registerView,
        builder: (context, state) => RegisterView(),
      ),
    ],
  );
}
