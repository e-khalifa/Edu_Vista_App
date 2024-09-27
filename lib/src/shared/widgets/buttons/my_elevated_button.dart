import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyElevatedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;
  final double size;
  const MyElevatedButton(
      {required this.child,
      required this.onPressed,
      this.size = 57,
      this.color = ColorUtility.secondary,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.maxFinite, size.h),
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: child);
  }
}
