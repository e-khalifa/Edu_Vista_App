import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/buttons/my_text_button.dart';

class LabelWidget extends StatelessWidget {
  final String? label;
  final void Function()? seeAllPressed;

  const LabelWidget(
      {required this.label, required this.seeAllPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label!,
            style: TextUtility.subtitleText(color: ColorUtility.mediumBlack),
          ),
          MyTextButton(
            text: 'See All',
            onPressed: seeAllPressed,
            textStyle: TextUtility.body2Text(),
          )
        ],
      ),
    );
  }
}
