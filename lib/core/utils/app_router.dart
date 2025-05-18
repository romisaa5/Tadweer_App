import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/Features/Auth/Forget%20password/presentation/views/forget_password.dart';
import 'package:toda_app/Features/Auth/Login/presentation/views/login_view.dart';
import 'package:toda_app/Features/Auth/Register/presentation/views/email_verified_view.dart';
import 'package:toda_app/Features/Auth/Register/presentation/views/register_view.dart';
import 'package:toda_app/Features/Auth/Register/presentation/views/up_load_image_view.dart';
import 'package:toda_app/Features/home/models/task_model.dart';
import 'package:toda_app/Features/home/presentation/home_view.dart';
import 'package:toda_app/Features/home/presentation/views/edit_task_view.dart';
import 'package:toda_app/Features/onboarding/presentation/views/language_theme_selection_view.dart';
import 'package:toda_app/Features/onboarding/presentation/views/first_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/second_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/third_screen.dart';
import 'package:toda_app/Features/onboarding/presentation/views/welcome_view.dart';

abstract class AppRouter {
  static const String langaugethemeselection = '/langaugethemeselection';
  static final firstScreen = '/onboardingscreen1';
  static final thirdScreen = '/onboardingscreen3';
  static final secondScreen = '/onboardingscreen2';
  static final welcomeView = '/welcomeview';
  static final loginView = '/loginview';
  static final registerView = '/registerview';
  static final emailVerifiedView = '/emailverifiedview';
  static final upLoadimage = '/uploadimage';
  static final forgetpasssword = '/forgetpassword';
  static final String homeview = '/homeview';
  static const String appSetting = '/appSetting';
  static const String taskediting = '/taskediting';
  static final router = GoRouter(
    initialLocation: langaugethemeselection,
    routes: [
      GoRoute(
        path: langaugethemeselection,
        builder: (context, state) =>
            (FirebaseAuth.instance.currentUser != null &&
                    FirebaseAuth.instance.currentUser!.emailVerified)
                ? HomeView()
                : LanguageThemeSelectionView(),
      ),
      GoRoute(path: firstScreen, builder: (context, state) => FirstScreen()),
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
        path: emailVerifiedView,
        builder: (context, state) => EmailVerifiedView(),
      ),
      GoRoute(
        path: upLoadimage,
        builder: (context, state) => UploadImageView(),
      ),
      GoRoute(
        path: forgetpasssword,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        path: appSetting,
        builder: (context, state) => LanguageThemeSelectionView(),
      ),
      GoRoute(
        path: homeview,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: taskediting,
        builder: (context, state) {
          final task = state.extra as TaskModel;
          return EditTaskScreen(task: task);
        },
      ),
    ],
  );
}
