import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> createUser(
      {required String fullName,
      required String email,
      required String password}) async {
    await productCollection.doc().set({
      'fullName': fullName,
      'email': email,
      'password': password,
      'walletAmount': '0'
    });
  }
}
