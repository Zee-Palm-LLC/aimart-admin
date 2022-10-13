import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/data.dart';

class ProductColorCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Color cardColor;
  final Widget child;
  const ProductColorCard(
      {Key? key, this.onTap, required this.cardColor, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 80.w,
        padding: EdgeInsets.all(2.h),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r), color: cardColor),
        child: child,
      ),
    );
  }
}
