import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/data.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h),
              SvgPicture.asset(CustomAssets.klogo),
              SizedBox(height: 25.h),
              Text('Welcome to Aimart !', style: CustomTextStyles.kBold28),
              SizedBox(height: 30.h),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Admin Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your email';
                          } else if (!value.isEmail) {
                            return 'Email is not correct';
                          } else if (value != "admin@jobblish.com") {
                            // ye email hy
                            return 'Enter your admin email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: passwordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Admin Password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PrimaryAppButton(
                        width: 300,
                        backgroundColor: CustomColors.kPrimary,
                        child: Text('Continue',
                            style: CustomTextStyles.kBold16
                                .copyWith(color: CustomColors.kWhite)),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // controller.signInWithEmailAndPassword(
                            //     email: emailController.text,
                            //     password: passwordController.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
