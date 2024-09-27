import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/fetch_image_widget.dart';

class CourseTile extends StatelessWidget {
  final String? title;
  final String? description;
  final String image;
  final String imagePlaceHolder;
  final double width;
  final double height;
  final Widget? child;
  final Function()? onTap;

  const CourseTile(
      {required this.title,
      this.description,
      required this.image,
      required this.imagePlaceHolder,
      required this.width,
      required this.height,
      this.child,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(9.r),
              child: FetchImageWidget(
                  image: image, imagePlaceHolder: imagePlaceHolder)),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            children: [
              Text(title!,
                  style: TextUtility.headerText(fontWeight: FontWeight.w600)),
              if (child != null) child!,
            ],
          ),
        )
      ]),
    );
  }
}
