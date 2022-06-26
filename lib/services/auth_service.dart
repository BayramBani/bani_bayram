import 'package:bani_bayram/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

import '../models/user_model.dart';

var log = Logger();

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // ---------- Email & Password ----------------------------------------------------

  Future<UserModel?> signUpWithEmail(String email, String password) async {
    UserCredential userCredential =
        await auth.createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      UserModel user = UserModel(uid: userCredential.user!.uid, email: email);
      return user;
    }
    return null;
  }

  Future<UserModel?> signInWithEmail(String email, String password) async {
    UserModel? userModel;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      userModel = UserModel(
        uid: value.user!.uid,
        email: value.user!.email,
      );
      return userModel;
    }).catchError((error) {
      log.e(error);
    });
    return userModel;
  }

  // ---------- Social login --------------------------------------------------------

  Future<UserModel?> signInWithGoogle() async {
    // Social login with Google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    UserModel? userModel;
    if (userCredential.additionalUserInfo != null) {
      String email = userCredential.additionalUserInfo!.profile!['email'];
      // todo get user information from Firestore
      userModel = await UserService().getUserByEmail(email);
      log.v(userModel, 'signInWithGoogle: userModel');
      if (userModel != null) {
        return userModel;
      } else {
        // todo create new user
        userModel = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          firstName: userCredential.user!.displayName,
          photo: userCredential.user!.photoURL,
        );
        String? userID = await UserService().addUser(userModel);
        if (userID == null) {
          userModel = null;
        }
      }
    }
    return userModel;
  }

  // ---------- Sign Out -------------------------------------------------------------

  void signOut(BuildContext context) {
    auth.signOut();
    GoogleSignIn().signOut();
  }

  void logCurrentUser() {
    log.i(auth.currentUser, 'currentUser');
  }
}
