import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../data/lecture_model.dart';

part 'lecture_event.dart';
part 'lecture_state.dart';

class LectureBloc extends Bloc<LectureEvent, LectureState> {
  LectureBloc() : super(LectureInitial()) {
    on<LectureChosenEvent>(_onLectureChosen);
    on<LectureEventInitial>((event, emit) {
      emit(LectureInitial());
    });
    on<LectureProgressUpdateEvent>(_onLectureProgressUpdate);
  }

  FutureOr<void> _onLectureChosen(
      LectureChosenEvent event, Emitter<LectureState> emit) {
    emit(LectureChosenState(event.lecture));
  }

  Future<void> _onLectureProgressUpdate(
      LectureProgressUpdateEvent event, Emitter<LectureState> emit) async {
    try {
      await FirebaseFirestore.instance
          .collection('course_user_progress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        event.courseId!: FieldValue.increment(1),
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection('course_user_progress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({event.courseId!: 1});
    }
    emit(LectureProgressUpdatedState());
  }

  FutureOr<List<Lecture>?> fetchLectures(String courseId) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .collection('lectures')
          .orderBy("sort")
          .get();

      return result.docs
          .map((e) => Lecture.fromJson({
                'id': e.id,
                ...e.data(),
              }))
          .toList();
    } catch (e) {
      return null;
    }
  }
}
