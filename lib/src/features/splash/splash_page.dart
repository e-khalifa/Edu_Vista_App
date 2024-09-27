import 'package:edu_vista/src/features/home/presentation/pages/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/services/pref_service.dart';
import '../../shared/utils/color_utility.dart';
import '../../shared/utils/image_utility.dart';
import '../auth/presentation/pages/login_page.dart';
import '../onboarding/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController rotateController;

  @override
  void initState() {
    super.initState();
    capRotating();
  }

  void capRotating() {
    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          rotateController.stop();
          navigateToNextPage();
        }
      })
      ..forward(); // Start the animation
  }

  Future<void> navigateToNextPage() async {
    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreferencesService.isOnBoardingSeen
              ? FirebaseAuth.instance.currentUser != null
                  ? const RootPage()
                  : const LoginPage()
              : const OnBoardingPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtility.scaffoldBackground,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              ImageUtility.eduVista,
              width: 239.h,
              height: 106.h,
            ),
          ),
          Positioned(
            right: 220.w,
            left: 0.w,
            top: 0.h,
            bottom: 75.h,
            child: RotationTransition(
              turns: rotateController,
              child: Image.asset(
                ImageUtility.cap,
                width: 77.8.w,
                height: 77.8.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
