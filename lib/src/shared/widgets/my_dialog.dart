import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:edu_vista/src/shared/widgets/buttons/my_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDialog extends StatelessWidget {
  final String title;
  final Widget? child;
  final IconData? icon;

  final Function()? onConfirm;

  const MyDialog({
    super.key,
    required this.title,
    required this.child,
    this.icon,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: ColorUtility.scaffoldBackground,
      surfaceTintColor: ColorUtility.scaffoldBackground,
      title: Column(
        children: [
          if (icon != null)
            Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: ColorUtility.subtleGrey,
                border: Border.all(color: ColorUtility.softGrey),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: ColorUtility.grey,
                size: 40.sp,
              ),
            ),
          SizedBox(height: 5.h),
          Text(title, style: TextUtility.titleText()),
          SizedBox(height: 10.h),
        ],
      ),
      content: child,
      actions: [
        Column(
          children: [
            MyElevatedButton(
                color: ColorUtility.subtleGrey,
                child: Text('Cancel',
                    style: TextUtility.fringeText(color: ColorUtility.grey)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            SizedBox(height: 10.h),
            MyElevatedButton(
                child: Text('Confirm',
                    style: TextUtility.fringeText(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm!();
                }),
          ],
        ),
      ],
    );
  }
}
