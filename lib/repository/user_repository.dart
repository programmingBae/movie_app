// import 'package:dio/dio.dart';
// import 'package:movie_app/entities/user.dart';

// class UserRepository {
//   Future _signUp async {

//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/entities/user.dart' as UserEntity;

class UserRepository {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(UserEntity.User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'fullName': user.fullName,
      'walletAmount': user.walletAmount,
    });
  }

  static Future<UserEntity.User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id.toString()).get();

    return UserEntity.User(
      id: snapshot.id,
      email: snapshot['email'],
      password: snapshot['password'],
      fullName: snapshot['fullName'],
      walletAmount: snapshot['walletAmount'],
    );
  }
}
