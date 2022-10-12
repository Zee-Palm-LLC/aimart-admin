import 'package:aimart_admin/app/data/color.dart';
import 'package:aimart_admin/app/data/typograpghy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<T> dropDownList;
  final T? currentItem;
  final String hintText;
  final String heading;
  final void Function(T?)? onchanged;
  const CustomDropDown(
      {Key? key,
      required this.dropDownList,
      this.currentItem,
      required this.hintText,
      required this.heading,
      this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: CustomTextStyles.kBold16
                .copyWith(color: CustomColors.kDarkBlue),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 55.h,
            width: 400.w,
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: CustomColors.kWhite,
                border: Border.all(color: CustomColors.kGrey2)),
            child: DropdownButton<T>(
              isDense: true,
              isExpanded: true,
              menuMaxHeight: 400.h,
              underline: const SizedBox(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: CustomColors.kDarkBlue,
              ),
              borderRadius: BorderRadius.circular(10),
              items: dropDownList.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: CustomTextStyles.kMedium16,
                  ),
                );
              }).toList(),
              disabledHint: Text(
                hintText,
                style: CustomTextStyles.kMedium16
                    .copyWith(color: CustomColors.kGrey),
              ),
              hint: Text(
                hintText,
                style: CustomTextStyles.kMedium16
                    .copyWith(color: CustomColors.kGrey),
              ),
              style: CustomTextStyles.kMedium16
                  .copyWith(color: CustomColors.kDarkBlue),
              onChanged: onchanged,
              value: currentItem,
            ),
          ),
        ],
      ),
    );
  }
}
