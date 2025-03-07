import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Builder( 
          builder: (context) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              theme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
