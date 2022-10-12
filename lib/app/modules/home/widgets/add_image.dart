import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/data.dart';

class AddImage extends StatelessWidget {
  final VoidCallback onTap;
  const AddImage({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: CustomColors.kWhite,
            border: Border.all(color: CustomColors.kPrimary)),
        child: Center(
          child: Icon(
            Icons.add,
            color: CustomColors.kPrimary,
            size: 40.h,
          ),
        ),
      ),
    );
  }
}
