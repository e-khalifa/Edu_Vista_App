import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function()? onPressed;

  const ProfileListTile(
      {super.key, required this.title, this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorUtility.softGrey),
        color: ColorUtility.subtleGrey,
      ),
      child: ListTile(
          title: Text(title,
              style: TextUtility.bodyText(fontWeight: FontWeight.w800)),
          subtitle: Text(
            subtitle ?? '',
            style: TextUtility.body2Text(
                fontWeight: FontWeight.w300, color: ColorUtility.grey),
          ),
          trailing: IconButton(
            icon: Icon(subtitle == '' ? Icons.add : Icons.edit),
            onPressed: onPressed,
          )),
    );
  }
}
