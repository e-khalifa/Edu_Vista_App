import 'package:edu_vista/src/features/category/presentation/pages/categories_page.dart';
import 'package:edu_vista/src/features/course/presentation/pages/see_all_courses_page.dart';
import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/features/home/presentation/widgets/label_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/utils/text_utility.dart';
import '../../../cart/presentation/widgets/shopping_cart_button.dart';
import '../../../category/presentation/widgets/categories_tabs.dart';
import '../../../course/presentation/widgets/courses_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Welcome Back', style: TextUtility.titleText()),
                  Text(
                      ' ${FirebaseAuth.instance.currentUser?.displayName?.split(' ').first}',
                      style: TextUtility.titleText(color: ColorUtility.main))
                ],
              ),
              const ShoppingCartButton(),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
            child: Column(
              children: [
                LabelWidget(
                    label: 'Categories',
                    seeAllPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoriesPage()));
                    }),
                SizedBox(height: 10.h),
                const CategoriesTabs(),
                SizedBox(height: 30.h),
                LabelWidget(
                    label: 'Top Rated Courses',
                    seeAllPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SeeAllCoursesPage(
                                    label: 'Top Rated Courses',
                                    rankValue: 'top rated',
                                  )));
                    }),
                SizedBox(height: 10.h),
                const CoursesWidget(rankValue: 'top rated'),
                SizedBox(height: 20.h),
                LabelWidget(
                    label: 'Best Seller Courses',
                    seeAllPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SeeAllCoursesPage(
                                    label: 'Best Seller Courses',
                                    rankValue: 'best seller',
                                  )));
                    }),
                SizedBox(height: 10.h),
                const CoursesWidget(rankValue: 'best seller'),
              ],
            ),
          ),
        )));
  }
}
