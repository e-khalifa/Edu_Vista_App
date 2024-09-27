import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double sizedBoxHeight;
  final double imageHeight;

  const OnBoardingItem(
      {required this.imagePath,
      required this.title,
      required this.description,
      this.sizedBoxHeight = 170,
      this.imageHeight = 300,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: sizedBoxHeight.h),
        Image.asset(
          imagePath,
          height: imageHeight.h,
          width: double.infinity.w,
        ),
        SizedBox(height: 30.h),
        Text(
          title,
          style: TextUtility.titleText(),
        ),
        SizedBox(height: 20.h),
        Text(
          description,
          style: TextUtility.descriptionText(
            fontWeight: FontWeight.w400,
            color: ColorUtility.grey,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
