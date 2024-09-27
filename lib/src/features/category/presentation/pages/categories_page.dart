import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/shared/widgets/tiles/my_expansion_tile.dart';
import 'package:edu_vista/src/features/course/presentation/widgets/courses_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/my_app_bar.dart';
import '../../../../shared/widgets/builders/my_future_builder.dart';
import '../../../course/data/course_model.dart';
import '../../data/category_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesFutureCall =
        FirebaseFirestore.instance.collection('categories').get();

    return Scaffold(
        appBar: const MyAppBar(
          title: 'Categories',
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
          child: MyFutureBuilder<Category>(
            futureCall: categoriesFutureCall,
            fromJson: (doc) => Category.fromJson({'id': doc.id, ...doc.data()}),
            builder: (ctx, categories) {
              return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: categories.length,
                  itemBuilder: (context, index) => MyExpansionTile(
                        title: categories[index].name,
                        child: MyFutureBuilder(
                            futureCall: FirebaseFirestore.instance
                                .collection('courses')
                                .where('category.id',
                                    isEqualTo: categories[index].id)
                                .get(),
                            fromJson: (doc) =>
                                Course.fromJson({'id': doc.id, ...doc.data()}),
                            builder: (context, courses) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.h),
                                  child: SizedBox(
                                      height: 360.h,
                                      child: CoursesWrap(courses: courses)));
                            }),
                      ));
            },
          ),
        )));
  }
}
