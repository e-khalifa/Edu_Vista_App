import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../data/model/user_model.dart';
import '../../data/service/user_service.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final UserService _userService = UserService();
  AppUser? user;

  Future<void> fetchUserData() async {
    emit(UserLoading());
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        emit(UserError('No user is logged in.'));
        return;
      }

      DocumentSnapshot userDoc = await _userService.getUserData(userId);

      if (userDoc.exists) {
        user = AppUser.fromJson({
          'id': userDoc.id,
          ...userDoc.data() as Map<String, dynamic>,
        });

        emit(UserLoaded(user!));
      } else {
        emit(UserError('User document does not exist.'));
      }
    } catch (e) {
      emit(UserError('Error fetching user data: $e'));
    }
  }

  Future<void> createUser({
    required String name,
    required String email,
    String? phoneNumber,
    String? gender,
    String? age,
  }) async {
    emit(UserLoading());
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      AppUser userData = AppUser(
        id: userId,
        name: name,
        email: email,
        gender: gender,
        phoneNumber: phoneNumber,
        age: age,
      );

      await _userService.createUser(userId, userData.toJson());
      emit(CreateUserSuccessfully());
    } catch (error) {
      emit(CreateUserFailed(error.toString()));
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    emit(ImageUploading());
    try {
      var imageResult = await FilePicker.platform
          .pickFiles(type: FileType.image, withData: true);

      if (imageResult == null) {
        emit(UserError('No file selected.'));
        return;
      }

      var fileBytes = imageResult.files.first.bytes;
      var fileName = imageResult.files.first.name;

      if (fileBytes == null) {
        emit(UserError('Failed to get file data.'));
        return;
      }

      var storageRef = FirebaseStorage.instance.ref('images/$fileName');
      var uploadTask = storageRef.putData(
        fileBytes,
        SettableMetadata(
          contentType: 'image/${fileName.split('.').last}',
        ),
      );

      var snapshot = await uploadTask.whenComplete(() => {});

      if (snapshot.state == TaskState.success) {
        var downloadUrl = await snapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'image': downloadUrl});

        fetchUserData();
      } else {
        emit(UserError('Image upload failed.'));
      }
    } catch (e) {
      emit(UserError('Error uploading image: $e'));
    }
  }

  Future<void> updateUserData({
    String? name,
    String? email,
    String? phoneNumber,
    String? gender,
    String? age,
  }) async {
    emit(UserUpdating());
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final updates = <String, dynamic>{};
      if (name != null) updates['name'] = name;
      if (email != null) updates['email'] = email;
      if (phoneNumber != null) updates['phoneNumber'] = phoneNumber;
      if (gender != null) updates['gender'] = gender;
      if (age != null) updates['age'] = age;

      await _userService.updateUser(userId, updates);

      if (name != null) {
        await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      }

      fetchUserData();
    } catch (e) {
      emit(UserError('Failed to update user data: $e'));
    }
  }

  Future<bool> deleteUser(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user is currently logged in.')),
        );
        return false;
      }
      await user.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account deleted successfully')),
      );
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: $e')),
      );
      return false;
    }
  }
}
