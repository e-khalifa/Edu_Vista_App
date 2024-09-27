import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../../../../shared/utils/app_enums.dart';
import '../../../data/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseFetchEvent>(_onGetCourse);
    on<CourseOptionChosenEvent>(_onCourseOptionChosen);
  }

  Course? course;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  List<Course> _recentlyWatchedCourses = [];

  FutureOr<void> _onGetCourse(
      CourseFetchEvent event, Emitter<CourseState> emit) async {
    if (course != null) {
      course = null;
    }
    course = event.course;
    emit(CourseOptionStateChanges(CourseOptions.Lecture));
  }

  FutureOr<void> _onCourseOptionChosen(
      CourseOptionChosenEvent event, Emitter<CourseState> emit) {
    emit(CourseOptionStateChanges(event.courseOptions));
  }

  FutureOr<List<Course>?> fetchCourses() async {
    try {
      var result = await FirebaseFirestore.instance.collection('courses').get();

      return result.docs
          .map((e) => Course.fromJson({
                'id': e.id,
                ...e.data(),
              }))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchRecentlyViewedCourses() async {
    try {
      final rVCoursesSnapshot = await _fireStore
          .collection('users')
          .doc(userId)
          .collection('cart')
          .get();

      _recentlyWatchedCourses = rVCoursesSnapshot.docs
          .map((doc) => Course.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();

      emit(CourseRecentlyWatchedLoaded(_recentlyWatchedCourses));
    } catch (e) {
      print('Failed to load cart: $e');
    }
  }

  // tested
  Future<void> addCourseToRv(Course course) async {
    try {
      _recentlyWatchedCourses.add(course);

      await fetchRecentlyViewedCourses();
      for (var course in _recentlyWatchedCourses) {
        print(course.title);
      }
    } catch (e) {
      print('Failed to add course to cart: $e');
    }
  }
}
