import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/HomePage_Screen.dart';
import '../Widgets/My_Alert.dart';

abstract class BaseRegisterController {
  Future registerMethod(String email, String password);
}

class RegisterController implements BaseRegisterController {
  @override
  Future registerMethod(String Email, String Password) async {
    final currentUser=FirebaseAuth.instance.currentUser;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      if(currentUser==null){
        const Center(child: CircularProgressIndicator(color: Colors.black),
        );
      }

      Get.off(MyHomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MyAlert(
            Content: "The Password is too Weak").ShowAlert();
      }
      else if (e.code == 'email-already-in-use') {
        MyAlert(
            Content: "The account already exists for that email.").ShowAlert();
      }
      else{
        MyAlert(
            Content: "you Should Write Your Full Email",Subtitle: "Example: user11@Example.com").ShowAlert();
      }
    } catch (e) {
                //
    }
  }
}
