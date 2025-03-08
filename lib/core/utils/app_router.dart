import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Forget%20password/presentation/views/password_reset.dart';
import 'package:toda_app/Features/Forget%20password/presentation/views/set_new_password.dart';
import 'package:toda_app/Features/Forget%20password/presentation/views/verificationScreen.dart';
import 'package:toda_app/Features/Forget%20password/presentation/views/forget_password.dart';
import 'package:toda_app/Features/Login/presentation/views/login_view.dart';
import 'package:toda_app/Features/Register/presentation/views/register_view.dart';
import 'package:toda_app/Features/onboarding/presentation/views/first_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/second_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/third_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static final firstScreen = '/onboardingscreen1';
  static final thirdScreen = '/onboardingscreen3';
  static final secondScreen = '/onboardingscreen2';
  static final welcomeView = '/welcomeview';
  static final loginView = '/loginview';
  static final registerView = '/registerview';
  static final forgetpasssword = '/forgetpassword';
  static final verificationScreen = '/verificationScreen';
  static final passwordreset = '/passwordreset';
  static final setnewpassword = '/setnewpassword';
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
      GoRoute(
        path: forgetpasssword,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        path: verificationScreen,
        builder: (context, state) => VerificationScreen(),
      ),
      GoRoute(
        path: passwordreset,
        builder: (context, state) => PasswordReset(),
      ),
      GoRoute(
        path: setnewpassword,
        builder: (context, state) => SetNewPassword(),
      ),
    ],
  );
}
