import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDGXyuMff5dbI7te0X4IuyfcQfCsomjZp8",
            authDomain: "deteksi-dini-kebakaran-49169.firebaseapp.com",
            projectId: "deteksi-dini-kebakaran-49169",
            storageBucket: "deteksi-dini-kebakaran-49169.appspot.com",
            messagingSenderId: "425052406611",
            appId: "1:425052406611:web:2ee87e25e4f03e0f45d7a6",
            measurementId: "G-3B5YSH9D2P"));
  } else {
    await Firebase.initializeApp();
  }
}
