import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_flutter/const.dart';
import 'package:velocity_x/velocity_x.dart';
import '../screen/todoscreens/todolist_screen.dart';

class AuthController extends GetxController {
  ///observable variables
  RxBool ispasswordVisible = false.obs;
  var isLoading = false.obs;

  Map<String, dynamic>? userData;
  //signin in screen controlller
  var emailCsign = TextEditingController();
  var passwordCsign = TextEditingController();
  var usernameCsign = TextEditingController();
  //loginscreen controller
  var emailClogin = TextEditingController();
  var passwordClogin = TextEditingController();

//this is for if password visible or not to user
  void passwordVisible() {
    if (ispasswordVisible.value) {
      ispasswordVisible(false);
    } else {
      ispasswordVisible(true);
    }
  }
//this function signin user with facebook and save info in firebase
//if user is already logged in then don't store info

  loginwithfacebook(context) async {
    try {
      isLoading(true);
      final LoginResult loginResult = await facebookAuth.login();
      if (loginResult.status == LoginStatus.success) {
        //getting user data
        final data = await facebookAuth.getUserData();
        //getting access token from facebook
        userData = data;
        AuthCredential authCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        //login with firebase with access token
        firebaseAuth.signInWithCredential(authCredential);
        log(user!.uid);
        if (user != null) {
          await firebaseFirestore
              .collection(collectionUsers)
              .doc(user!.uid)
              .set({
            'userID': user!.uid,
            'userName': userData!['name'],
            'email': userData!['email'],
            'createdAt': DateTime.now()
          });
        }
        Get.offAll(() => TodolistScreen());
        isLoading(false);
      } else {
        VxToast.show(context, msg: loginResult.status.toString());
      }
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

//this fuction createUserWithEmail and save it to firebase with user id as collection
  Future createUserWithEmail() async {
    try {
      isLoading(true);
      await firebaseAuth.createUserWithEmailAndPassword(
          email: emailCsign.text, password: passwordCsign.text);

      await firebaseFirestore.collection(collectionUsers).doc(user!.uid).set({
        'userID': user!.uid,
        'userName': usernameCsign.text,
        'email': emailCsign.text,
        'createdAt': DateTime.now()
      });
      isLoading(false);
      Get.off(() => const TodolistScreen());
    } on Exception catch (e) {
      Get.rawSnackbar(title: 'Error', message: e.toString());
    }
  }

//this function login user with email
  loginUserWithEmail(context) async {
    try {
      isLoading(true);
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailClogin.text, password: passwordClogin.text);
      isLoading(false);
      Get.offAll(() => const TodolistScreen());
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

//this function signin user with google and save info in firebase
//if user is already logged in then don't store info
  signInWithGoogle(context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        // Getting users credential
        await firebaseAuth.signInWithCredential(authCredential);
        if (user != null) {
          await firebaseFirestore
              .collection(collectionUsers)
              .doc(user!.uid)
              .set({
            'userID': user!.uid,
            'userName': googleSignInAccount.displayName,
            'email': googleSignInAccount.email,
            'createdAt': DateTime.now()
          });
        }
      }
      Get.offAll(() => TodolistScreen());
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
