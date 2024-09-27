import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/features/course/presentation/widgets/courses_wrap.dart';
import 'package:edu_vista/src/shared/widgets/my_app_bar.dart';
import 'package:edu_vista/src/shared/widgets/builders/my_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/course_model.dart';

class SeeAllCoursesPage extends StatelessWidget {
  final String label;
  final String rankValue;

  const SeeAllCoursesPage(
      {required this.label, required this.rankValue, super.key});

  @override
  Widget build(BuildContext context) {
    final futureCall = FirebaseFirestore.instance
        .collection('courses')
        .where('rank', isEqualTo: rankValue)
        .orderBy('created_date', descending: true)
        .get();
    return Scaffold(
        appBar: MyAppBar(
          title: label,
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 30.h, right: 5.w, left: 30.w),
              child: MyFutureBuilder(
                  futureCall: futureCall,
                  fromJson: (doc) =>
                      Course.fromJson({'id': doc.id, ...doc.data()}),
                  builder: (context, courses) {
                    return SingleChildScrollView(
                        child: CoursesWrap(courses: courses));
                  })),
        ));
  }
}
