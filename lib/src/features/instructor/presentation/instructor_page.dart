import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/features/course/presentation/widgets/courses_wrap.dart';
import 'package:edu_vista/src/features/instructor/data/instructor_model.dart';
import 'package:edu_vista/src/shared/widgets/builders/my_future_builder.dart';
import 'package:edu_vista/src/shared/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/utils/color_utility.dart';
import '../../../shared/utils/image_utility.dart';
import '../../../shared/utils/text_utility.dart';
import '../../../shared/widgets/fetch_image_widget.dart';
import '../../course/data/course_model.dart';

class InstructorPage extends StatelessWidget {
  final Instructor? instructor;
  const InstructorPage({required this.instructor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Instructor Info'),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: FetchImageWidget(
                      image: instructor!.image!,
                      imagePlaceHolder:
                          ImageUtility.instructorImagePlaceholder)),
            ),
            SizedBox(height: 10.h),
            Text(
              instructor!.name ?? '',
              style: TextUtility.titleText(),
            ),
            SizedBox(height: 60.h),
            Container(
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(color: ColorUtility.softGrey)),
                child: Column(
                  children: [
                    _infoPoint('Education ', instructor!.education),
                    SizedBox(height: 20.h),
                    _infoPoint('Years of Experience ',
                        '${instructor!.yearsOfExperience} Years'),
                  ],
                )),
            SizedBox(height: 30.h),
            Row(
              children: [
                const Icon(
                  Icons.lightbulb,
                  color: ColorUtility.secondary,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Continue Learning with More Courses by the Instructor!',
                        style: TextUtility.headerText(
                            color: ColorUtility.mediumBlack,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildInstructorCourses(),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget _infoPoint(String? point, String? info) {
    return Row(
      children: [
        const Icon(Icons.arrow_right_alt, color: ColorUtility.mediumBlack),
        SizedBox(width: 10.w),
        Text(
          point!,
          style: TextUtility.headerText(
              color: ColorUtility.mediumBlack, fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Column(
            children: [
              Text(
                info!,
                style: TextUtility.fringeText(color: ColorUtility.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructorCourses() {
    final futureCall = FirebaseFirestore.instance.collection('courses').get();
    return MyFutureBuilder(
        futureCall: futureCall,
        fromJson: (doc) => Course.fromJson({'id': doc.id, ...doc.data()}),
        builder: (context, allCourses) {
          final instructorCourses = allCourses
              .where((course) => course.instructor!.name == instructor!.name)
              .toList();

          return instructorCourses.isNotEmpty
              ? CoursesWrap(courses: instructorCourses)
              : Text('No courses available for this instructor',
                  style: TextUtility.fringeText(color: ColorUtility.grey));
        });
  }
}
