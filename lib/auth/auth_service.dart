import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
//FIX THE EMAIL AND PASSWORD CONTROLLERS
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final creds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return creds.user;
    } catch (e) {
      log("Error creating user: $e ");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return creds.user;
    } catch (e) {
      log("Error logging in user : $e ");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Cant Sign out, Something went wrong: $e");
    }
  }
}