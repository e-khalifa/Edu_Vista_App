import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edu_vista/src/features/course/presentation/pages/views/certificate_view.dart';

import '../data/course_model.dart';

class CertificateDialog {
  static void show(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CertificateView(
          userName:
              FirebaseAuth.instance.currentUser!.displayName ?? 'Unknown User',
          coursetitle: course.title,
          instructorName: course.instructor?.name ?? 'Unknown Instructor',
        );
      },
    );
  }
}
