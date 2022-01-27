import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserModel? userFromFirebase(User? user){
    if(user == null) {
      return null;
    } else {
      return UserModel(uid: user.uid, email: user.email);
    }

  }

  Stream<UserModel?>? get user{
    return _firebaseAuth.authStateChanges().map(userFromFirebase);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async{
    final credintial = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userFromFirebase(credintial.user);

  }
  Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async{
    final credintial = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userFromFirebase(credintial.user);
  }

  Future<void> signOut()async{
    return await _firebaseAuth.signOut();
  }
}