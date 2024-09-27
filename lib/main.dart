import 'package:device_preview/device_preview.dart';
import 'package:edu_vista/src/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/app.dart';
import 'src/features/course/logic/bloc/course/course_bloc.dart';
import 'src/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'src/features/lecture/logic/lecture_bloc/lecture_bloc.dart';
import 'src/features/profile/logic/user_cubit/user_cubit.dart';
import 'firebase_options.dart';
import 'src/shared/services/pref_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  await dotenv.load(fileName: ".env");

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => AuthCubit()),
          BlocProvider(create: (ctx) => UserCubit()),
          BlocProvider(create: (ctx) => CartCubit()..fetchCart()),
          BlocProvider(create: (ctx) => CourseBloc()),
          BlocProvider(create: (ctx) => LectureBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
