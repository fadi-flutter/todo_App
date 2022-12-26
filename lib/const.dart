import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

const purple = Color(0xFF6966E0);
const purplelight = Color.fromARGB(166, 183, 183, 217);
const purplemedium = Color.fromARGB(166, 137, 137, 232);
const pink = Color.fromARGB(255, 228, 122, 157);
const white = Color(0xFFFFFFFF);
const black = Colors.black;
const blue = Color.fromARGB(255, 27, 114, 184);
const grey = Colors.grey;
const darkwhite = Color.fromARGB(255, 248, 245, 245);
const todopageBg = Color.fromARGB(255, 242, 243, 247);
const toggle = Color.fromARGB(255, 229, 229, 232);
const String userImage = 'assets/images/user.png';
const String googleIamge =
    'https://w7.pngwing.com/pngs/249/19/png-transparent-google-logo-g-suite-google-guava-google-plus-company-text-logo.png';
const String facebookImage =
    "https://www.clipartmax.com/png/middle/176-1763906_social-media-circle-facebook-icon-facebook-logo-round-vector.png";

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
User? user = firebaseAuth.currentUser;
const String collectionUsers = 'Users';
GoogleSignIn googleSignIn = GoogleSignIn();
