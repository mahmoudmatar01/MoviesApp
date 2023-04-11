import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/PresentationL/Screens/HomePage_Screen.dart';

import '../Widgets/My_Alert.dart';

abstract class BaseLoginController {
  Future loginMethod(String Email, String Password);
}

class LoginController implements BaseLoginController {
  @override
  Future loginMethod(String Email, String Password) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      if (currentUser == null) {
        const Center(
          child: CircularProgressIndicator(color: Colors.black),
        );
      }

      Get.off(MyHomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MyAlert(Content: "No user found for that email.").ShowAlert();
      } else if (e.code == 'wrong-password') {
        MyAlert(Content: "Wrong password provided for that user.").ShowAlert();
      } else {
        MyAlert(Content: "Not Complete Email").ShowAlert();
      }
    }
  }
}
