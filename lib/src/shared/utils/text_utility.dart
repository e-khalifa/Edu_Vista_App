import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_utility.dart';

class TextUtility {
  static TextStyle nameText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 24.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle titleText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontSize: 20.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle subtitleText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontSize: 18.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle descriptionText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 16.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle headerText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: 15.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle bodyText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 14.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body2Text({
    Color color = ColorUtility.mediumBlack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 13.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle fringeText({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 12.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle hintText({
    Color color = ColorUtility.grey,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: 11.sp,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
