import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toda_app/Features/Auth/Register/models/user_model.dart';

Future<UserModel?> fetchCurrentUserData() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return null;

  final doc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

  if (doc.exists) {
    return UserModel.fromJson(doc.data()!);
  } else {
    return null;
  }
}
