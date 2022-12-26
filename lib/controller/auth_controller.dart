import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_flutter/const.dart';
import 'package:velocity_x/velocity_x.dart';
import '../screen/todoscreens/todolist_screen.dart';

class AuthController extends GetxController {
  RxBool ispasswordVisible = false.obs;
  var isLoading = false.obs;
  GoogleSignInAccount? googleSignInAccount;
  //signin in screen controlller
  var emailCsign = TextEditingController();
  var passwordCsign = TextEditingController();
  var usernameCsign = TextEditingController();
  //loginscreen controller
  var emailClogin = TextEditingController();
  var passwordClogin = TextEditingController();

  void passwordVisible() {
    if (ispasswordVisible.value) {
      ispasswordVisible(false);
    } else {
      ispasswordVisible(true);
    }
  }

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

  signInWithGoogle(context) async {
    try {
      if (googleSignInAccount != null) {
        googleSignIn.signIn();
      }
      googleSignInAccount = await googleSignIn.signIn();
      await firebaseFirestore.collection(collectionUsers).doc(user!.uid).set({
        'userID': user!.uid,
        'userName': googleSignInAccount!.displayName,
        'email': googleSignInAccount!.email,
        'createdAt': DateTime.now()
      });
      Get.offAll(() => const TodolistScreen());
    } on Exception catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
