part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

class CourseOptionStateChanges extends CourseState {
  final CourseOptions courseOption;

  CourseOptionStateChanges(this.courseOption);
}

class CourseRecentlyWatchedLoaded extends CourseState {
  final List<Course> recentlyWatchedCourses;
  CourseRecentlyWatchedLoaded(this.recentlyWatchedCourses);
}
