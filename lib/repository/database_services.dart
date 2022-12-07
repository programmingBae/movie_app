import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(
      {required String fullName,
      required String uid,
      required String email,
      required String password}) async {
    await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      'password': password,
      'walletAmount': '0'
    });
  }

  static Future<void> topUp(
      {required String fullName,
      required String uid,
      required String email,
      required String password,
      required String amount}) async {
    await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      'password': password,
      'walletAmount': amount
    });
  }
}
