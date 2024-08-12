import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCjWkAKNAmSf5BODvd-HNhh2R9GYKRaqZw",
            authDomain: "food-planner-0jqlzf.firebaseapp.com",
            projectId: "food-planner-0jqlzf",
            storageBucket: "food-planner-0jqlzf.appspot.com",
            messagingSenderId: "499350555106",
            appId: "1:499350555106:web:396afbeb53cd9f929711bb"));
  } else {
    await Firebase.initializeApp();
  }
}
