import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/presentation/widgets/shopping_cart_button.dart';
import '../utils/text_utility.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title,
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: const ShoppingCartButton(),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
