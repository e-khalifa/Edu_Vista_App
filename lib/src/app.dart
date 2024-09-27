import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:edu_vista/src/features/splash/splash_page.dart';
import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Edu Vista',
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehaviour(),
            theme: ThemeData(
              fontFamily: "PlusJakartaSans",
              colorScheme: ColorScheme.fromSeed(seedColor: ColorUtility.main),
              scaffoldBackgroundColor: ColorUtility.scaffoldBackground,
              useMaterial3: true,
            ),
            home: const SplashPage(),
          );
        });
  }
}

class AppScrollBehaviour extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      };
}
