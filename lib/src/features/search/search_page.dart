import 'package:edu_vista/src/features/course/presentation/pages/course_page.dart';
import 'package:edu_vista/src/features/instructor/presentation/instructor_tile.dart';
import 'package:edu_vista/src/features/search/search_bar.dart';
import 'package:edu_vista/src/shared/utils/image_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/utils/text_utility.dart';
import '../cart/presentation/widgets/shopping_cart_button.dart';
import '../course/data/course_model.dart';
import '../course/presentation/widgets/course_tile.dart';
import '../instructor/data/instructor_model.dart';
import '../course/logic/bloc/course/course_bloc.dart';
import '../../shared/widgets/tiles/my_expansion_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Course>? courses;
  List<Course>? filteredCourses;
  List<Instructor?>? filteredInstructors;
  bool hasSearched = false;

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  Future<void> getCourses() async {
    courses = await context.read<CourseBloc>().fetchCourses();
  }

  void handleSearch(String query) {
    setState(() {
      hasSearched = true;

      if (courses != null) {
        filteredCourses = courses!.where((course) {
          return course.title!.toLowerCase().contains(query.toLowerCase());
        }).toList();

        filteredInstructors = courses!
            .map((course) => course.instructor)
            .where((instructor) =>
                instructor != null &&
                instructor.name!.toLowerCase().contains(query.toLowerCase()))
            .toSet()
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final noCoursesFound = filteredCourses != null && filteredCourses!.isEmpty;
    final noInstructorsFound =
        filteredInstructors != null && filteredInstructors!.isEmpty;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
              width: 290.w, child: MySearchBar(onSearch: handleSearch)),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 14.w,
              ),
              child: const ShoppingCartButton(),
            ),
          ]),
      body: hasSearched && noCoursesFound && noInstructorsFound
          ? Center(child: Image.asset(ImageUtility.notFound))
          : Padding(
              padding: EdgeInsets.only(
                  top: 40.h, bottom: 16.h, right: 16.w, left: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (filteredCourses != null && filteredCourses!.isNotEmpty)
                      _buildCategorySearch(),
                    SizedBox(height: 30.h),
                    if (filteredInstructors != null &&
                        filteredInstructors!.isNotEmpty)
                      _buildInstructorsSearch(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCategorySearch() {
    return MyExpansionTile(
      title: 'Courses',
      expanded: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemCount: filteredCourses!.length,
          itemBuilder: (context, index) {
            final course = filteredCourses![index];
            return CourseTile(
              title: course.title,
              image: course.image!,
              imagePlaceHolder: ImageUtility.courseImagePlaceholder,
              width: 120,
              height: 100,
              child: Row(
                children: [
                  Icon(Icons.person, size: 20.sp),
                  Text(
                    course.instructor?.name ?? '',
                    style: TextUtility.bodyText(),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoursePage(course: course)));
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildInstructorsSearch() {
    return MyExpansionTile(
      title: 'Instructors',
      expanded: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemCount: filteredInstructors!.length,
          itemBuilder: (context, index) {
            final instructor = filteredInstructors![index];
            return InstructorTile(instructor: instructor);
          },
        ),
      ),
    );
  }
}
