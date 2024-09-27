import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/features/category/presentation/pages/category_courses_page.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:edu_vista/src/shared/widgets/buttons/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/utils/color_utility.dart';
import '../../../../shared/widgets/builders/my_future_builder.dart';
import '../../data/category_model.dart';

class CategoriesTabs extends StatelessWidget {
  const CategoriesTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: MyFutureBuilder<Category>(
        futureCall: FirebaseFirestore.instance.collection('categories').get(),
        fromJson: (doc) => Category.fromJson({'id': doc.id, ...doc.data()}),
        builder: (ctx, categories) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) => MyTextButton(
                  text: categories[index].name ?? '',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryCoursesPage(
                                categoryName: categories[index].name ?? '')));
                  },
                  textStyle: TextUtility.headerText(),
                  textButtonStyle: TextButton.styleFrom(
                    backgroundColor: ColorUtility.softGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  )));
        },
      ),
    );
  }
}
