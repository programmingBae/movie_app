import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/services/database_services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signUp(fullName, email, password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await DatabaseServices.createUser(
        fullName: fullName, email: email, password: password);
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }
}
