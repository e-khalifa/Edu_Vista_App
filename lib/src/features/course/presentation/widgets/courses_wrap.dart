import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/course_model.dart';
import 'course_card.dart';

class CoursesWrap extends StatelessWidget {
  final List<Course> courses;
  const CoursesWrap({required this.courses, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(courses.length, (index) {
        return Container(
          width: 170.w,
          height: 300,
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              border: Border.all(color: ColorUtility.softGrey)),
          child: CourseCard(course: courses[index]),
        );
      }),
    );
  }
}
