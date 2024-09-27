import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/image_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/utils/text_utility.dart';
import '../../../cart/logic/cart_cubit/cart_cubit.dart';
import '../../../cart/presentation/widgets/shopping_cart_button.dart';
import '../../data/course_model.dart';
import '../widgets/course_tile.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().fetchBoughtCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'My Courses',
            style: TextUtility.titleText(),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: const ShoppingCartButton(),
            ),
          ]),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorUtility.secondary,
            ));
          }

          if (state is CartBoughtCourses) {
            if (state.boughtCourses.isEmpty) {
              return Center(
                  child: Text('You haven\'t bought any courses yet',
                      style: TextUtility.fringeText(color: ColorUtility.grey)));
            }

            return _buildBoughtCoursesList(state.boughtCourses);
          }

          return _buildPlaceHolderWidget();
        },
      ),
    );
  }

  Widget _buildBoughtCoursesList(List<Course> boughtCourses) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: boughtCourses.length,
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        final course = boughtCourses[index];
        return CourseTile(
          title: course.title,
          image: course.image!,
          imagePlaceHolder: ImageUtility.courseImagePlaceholder,
          width: 157,
          height: 105,
          child: Row(
            children: [
              Icon(Icons.person, size: 20.sp),
              Text(
                course.instructor?.name ?? '',
                style: TextUtility.bodyText(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlaceHolderWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageUtility.notFound),
          Text("No Courses Available at the moment")
        ],
      ),
    );
  }
}
