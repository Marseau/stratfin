import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAi1eUhKnmXZNsKKSjTZhbjCBpK7ixLH3I",
            authDomain: "stratfin-393617.firebaseapp.com",
            projectId: "stratfin-393617",
            storageBucket: "stratfin-393617.appspot.com",
            messagingSenderId: "473172521347",
            appId: "1:473172521347:web:64174ee5fd5248991386b6",
            measurementId: "G-8K3ETQBQ8H"));
  } else {
    await Firebase.initializeApp();
  }
}
