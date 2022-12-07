import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/repository/database_services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signUp(fullName, email, password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DatabaseServices.updateUser(
          fullName: fullName,
          email: email,
          password: password,
          uid: result.user!.uid);

      User? user = result.user;
      return user;
    } on Exception catch (e) {
      // TODO
      return null;
    }
  }

  static Future<User?> signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } on Exception catch (e) {
      // TODO
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}
