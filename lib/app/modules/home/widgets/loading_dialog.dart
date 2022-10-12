import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        content: SizedBox(
            width: 250.w,
            height: 60.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(CustomColors.kPrimary),
                ),
                SizedBox(width: 20.w),
                Text(
                  message,
                  style: CustomTextStyles.kBold20,
                )
              ],
            )),
      ),
    );
  }
}

Future<void> showLoadingDialog({required String message}) {
  return Get.dialog(LoadingDialog(message: message), barrierDismissible: false);
}

void hideLoadingDialog() {
  return Get.back();
}

extension SnapshotExtensions on AsyncSnapshot {
  bool isNotLoaded() {
    return connectionState == ConnectionState.waiting;
  }
}
