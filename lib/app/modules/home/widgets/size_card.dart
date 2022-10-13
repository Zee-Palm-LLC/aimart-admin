import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/data.dart';

class ProductSizeCard extends StatelessWidget {
  final Color textColor;
  final Color cardColor;
  final String text;
  final VoidCallback? onTap;
  const ProductSizeCard(
      {Key? key,
      required this.textColor,
      required this.cardColor,
      required this.text,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: cardColor),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyles.kMedium16.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
