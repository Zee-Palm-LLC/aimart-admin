import 'package:flutter/material.dart';

class PrimaryAppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double width;
  const PrimaryAppButton(
      {Key? key,
      required this.width,
      required this.child,
      required this.onTap,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          fixedSize: Size(width, 50),
          primary: backgroundColor,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: onTap,
        child: child);
  }
}
