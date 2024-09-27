import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_utility.dart';

class MyExpansionTile extends StatefulWidget {
  final String? title;
  final Widget child;
  final bool expanded;

  const MyExpansionTile(
      {super.key,
      required this.child,
      required this.title,
      this.expanded = false});

  @override
  _MyExpansionTileState createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title!,
        style: TextStyle(
            fontSize: 15.sp,
            fontWeight: isExpanded ? FontWeight.w700 : FontWeight.w500),
      ),
      initiallyExpanded: widget.expanded,
      collapsedBackgroundColor: ColorUtility.softGrey,
      backgroundColor: ColorUtility.scaffoldBackground,
      iconColor: ColorUtility.secondary,
      textColor: ColorUtility.secondary,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: Colors.transparent, width: 0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: ColorUtility.softGrey, width: 0.5),
      ),
      dense: true,
      onExpansionChanged: (expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: [
        widget.child,
      ],
    );
  }
}
