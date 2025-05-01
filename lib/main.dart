import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/Auth/Login/data/cubit/login_cubit.dart';
import 'package:toda_app/Features/Auth/Register/data/cubit/register_cubit.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/core/helper/localizition_method.dart';
import 'package:toda_app/core/themes/Theme_Provider.dart';
import 'package:toda_app/core/themes/app_theme.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/firebase_options.dart';
import 'package:toda_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider())
      ],
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===========================User is currently signed out!');
      } else {
        print('===========================User is signed in!');
      }
    });
    super.initState();

    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Builder(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => LoginCubit()),
                BlocProvider(create: (context) => RegisterCubit()),
              ],
              child: MaterialApp.router(
                locale: languageProvider.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                routerConfig: AppRouter.router,
                theme: AppTheme.ligthTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.themeMode,
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        );
      },
    );
  }
}
