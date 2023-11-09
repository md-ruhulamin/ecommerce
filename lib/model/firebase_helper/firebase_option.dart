// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DeafultfirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return FirebaseOptions(
          apiKey: "1:851137586958:android:6aca0e8fc65170de3dd95f",
          appId: "AIzaSyAh0vPYmfQx-nrDmOfyhBNTodw4Bjjcdyo",
          messagingSenderId: "851137586958",
          projectId: "ecommerce-578b9",
          iosBundleId: 'com.example.ecommerce');
    } else {
      return FirebaseOptions(
        appId: "1:851137586958:android:385b47c319bd79de3dd95f",
        apiKey: "AIzaSyAh0vPYmfQx-nrDmOfyhBNTodw4Bjjcdyo",
        messagingSenderId: "851137586958",
        projectId: "cecommerce-578b9",
      );
    }
  }
}
