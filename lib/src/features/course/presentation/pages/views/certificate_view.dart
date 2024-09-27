import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/utils/color_utility.dart';

class CertificateView extends StatelessWidget {
  final String? userName;
  final String? coursetitle;
  final String? instructorName;

  const CertificateView({
    super.key,
    required this.userName,
    required this.coursetitle,
    required this.instructorName,
  });

  @override
  Widget build(BuildContext context) {
    return _getCertificateDialog(context);
  }

  Widget _getCertificateDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorUtility.scaffoldBackground,
      surfaceTintColor: ColorUtility.scaffoldBackground,
      title: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Certificate of Completion',
                style: TextUtility.titleText(),
              ),
              SizedBox(height: 20.h),
              Text('This Certifies that', style: TextUtility.fringeText()),
              SizedBox(height: 20.h),
              Text(
                userName!,
                style: TextUtility.nameText(
                  color: ColorUtility.main,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Has Successfully Completed the Wallace Training Program, Entitled.',
                style: TextUtility.body2Text(
                    color: ColorUtility.grey, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Text(
                coursetitle!,
                style: TextUtility.descriptionText(
                  color: ColorUtility.mediumBlack,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              Text(
                instructorName!,
                style: TextUtility.subtitleText(
                  color: ColorUtility.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
