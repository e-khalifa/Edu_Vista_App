import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final String description =
      "At EduVista, we're passionate about making learning accessible and enjoyable for everyone. Our mission is to bring high-quality education to your fingertips, whether you're a student looking to excel or a lifelong learner exploring new interests.";
  final String cTA =
      "Join our community of learners today and start your journey towards achieving your goals!";
  final String slogan = "EduVista – Learning Made Simple.";
  final String version = "EduVista @Version 1.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us',
          style: TextUtility.titleText(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
              )),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 20.h),
        child: Column(children: [
          Text(
            'Welcome to EduVista!',
            style: TextUtility.headerText(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: ColorUtility.softGrey),
            ),
            child: Column(
              children: [
                Text(
                  description,
                  style: TextUtility.fringeText(color: ColorUtility.grey),
                ),
                SizedBox(height: 20.h),
                Text(
                  cTA,
                  style: TextUtility.fringeText(color: ColorUtility.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            slogan,
            style: TextUtility.body2Text(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            version,
            style: TextUtility.hintText(),
          ),
        ]),
      ),
    );
  }
}
