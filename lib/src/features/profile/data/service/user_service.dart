import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<DocumentSnapshot> getUserData(String userId) {
    return _firestore.collection("users").doc(userId).get();
  }

  Future<void> createUser(String userId, Map<String, dynamic> data) {
    return _firestore.collection("users").doc(userId).set(data);
  }

  Future<void> updateUser(String userId, Map<String, dynamic> data) {
    return _firestore.collection("users").doc(userId).update(data);
  }

  Future<String> uploadImage(Uint8List data, String fileName) async {
    var storageRef = _storage.ref('images/$fileName');
    await storageRef.putData(data);
    return await storageRef.getDownloadURL();
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
