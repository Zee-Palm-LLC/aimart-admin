import 'package:aimart_admin/app/data/theme.dart';
import 'package:aimart_admin/app/modules/home/bindings/home_binding.dart';
import 'package:aimart_admin/app/modules/home/model/algolia.dart';
import 'package:aimart_admin/app/modules/home/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:algolia/algolia.dart';

import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Algolia algolia = AlgoliaApplication.algolia;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 720),
      builder: (context, widget) {
        return GetMaterialApp(
            title: "Aimart",
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: const SplashScreen(),
            initialBinding: HomeBinding(),
            defaultTransition: Transition.rightToLeft,
            theme: mainTheme);
      },
    );
  }
}
