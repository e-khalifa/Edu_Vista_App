import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/features/course/presentation/widgets/courses_wrap.dart';
import 'package:edu_vista/src/shared/widgets/my_app_bar.dart';
import 'package:edu_vista/src/shared/widgets/builders/my_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../course/data/course_model.dart';

class CategoryCoursesPage extends StatelessWidget {
  final String categoryName;

  const CategoryCoursesPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final futureCall = FirebaseFirestore.instance
        .collection('courses')
        .where('category.name', isEqualTo: categoryName)
        .get();
    return Scaffold(
        appBar: MyAppBar(
          title: categoryName,
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 20.h, right: 5.w, left: 30.w),
              child: MyFutureBuilder(
                  futureCall: futureCall,
                  fromJson: (doc) =>
                      Course.fromJson({'id': doc.id, ...doc.data()}),
                  builder: (context, courses) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: SizedBox(
                            height: 360.h,
                            child: CoursesWrap(courses: courses)));
                  })),
        ));
  }
}
