import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/data.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?)? validator;
  int fieldWidth;
  int maxLines;
  List<TextInputFormatter>? inputFormatters;
  CustomTextFormField(
      {Key? key,
      this.maxLines = 1,
      required this.controller,
      required this.isPassword,
      required this.textInputAction,
      required this.keyboardType,
      required this.hintText,
      required this.validator,
      this.inputFormatters,
      this.fieldWidth = 300})
      : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool show = false;
  @override
  void initState() {
    setState(() {
      show = widget.isPassword;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth.toDouble(),
      child: Theme(
        data: ThemeData(hintColor: CustomColors.kGrey2),
        child: TextFormField(
          maxLines: widget.maxLines,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          obscureText: show,
          keyboardType: widget.keyboardType,
          style: CustomTextStyles.kMedium16,
          decoration: InputDecoration(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 65),
              filled: true,
              errorStyle: CustomTextStyles.kMedium12
                  .copyWith(color: CustomColors.kError, height: 1),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      icon: show
                          ? SvgPicture.asset(CustomAssets.kvisible)
                          : SvgPicture.asset(CustomAssets
                              .kvisibleOff)) //INSERT CUSTOM ICONS HERE ONLY PLACEHOLDER ICONS FOR NOW
                  : const SizedBox(),
              hintText: widget.hintText,
              hintStyle: CustomTextStyles.kMedium14
                  .copyWith(color: CustomColors.kGrey2),
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: CustomColors.kGrey2)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: CustomColors.kGrey2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: CustomColors.kPrimary)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: CustomColors.kError)),
              fillColor: CustomColors.kWhite),
        ),
      ),
    );
  }
}
