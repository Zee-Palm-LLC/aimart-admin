import 'package:aimart_admin/app/modules/home/views/auth/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/assets.dart';
import '../../../../data/typograpghy.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 700.sp,
      centered: true,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(CustomAssets.klogo),
          Text('AIMART', style: CustomTextStyles.kBold40)
        ],
      ),
      nextScreen: SignInScreen(),
    );
  }
}
