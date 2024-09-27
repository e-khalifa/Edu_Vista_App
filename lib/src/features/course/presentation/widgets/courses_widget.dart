import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/course_model.dart';
import 'course_card.dart';
import '../../../../shared/widgets/builders/my_future_builder.dart';

class CoursesWidget extends StatelessWidget {
  final String rankValue;
  const CoursesWidget({super.key, required this.rankValue});

  @override
  Widget build(BuildContext context) {
    final futureCall = FirebaseFirestore.instance
        .collection('courses')
        .where('rank', isEqualTo: rankValue)
        .orderBy('created_date', descending: true)
        .get();

    return MyFutureBuilder<Course>(
      futureCall: futureCall,
      fromJson: (doc) => Course.fromJson({'id': doc.id, ...doc.data()}),
      builder: (context, courses) {
        return SizedBox(
          height: 300.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Container(
                width: 170.w,
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                child: CourseCard(course: courses[index]),
              );
            },
          ),
        );
      },
    );
  }
}
