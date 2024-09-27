import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySearchBar extends StatelessWidget {
  final Function(String)? onSearch;
  const MySearchBar({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 44.h,
        width: 230.w,
        child: TextField(
          onChanged: onSearch,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search...',
            filled: true,
            fillColor: ColorUtility.scaffoldBackground,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorUtility.softGrey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorUtility.secondary),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ));
  }
}
