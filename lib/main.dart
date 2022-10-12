import 'package:aimart_admin/app/data/theme.dart';
import 'package:aimart_admin/app/modules/home/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 720),
      builder: (context, widget) {
        return GetMaterialApp(
            title: "Flutter Express",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: const SplashScreen(),
            defaultTransition: Transition.rightToLeft,
            theme: mainTheme);
      },
    );
  }
}
