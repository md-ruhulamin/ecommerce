// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/firebase_helper/firebase_authhelper/firebase_auth_helper.dart';
import 'package:ecommerce/firebase_helper/firebase_option.dart';
import 'package:ecommerce/mytheme.dart';
import 'package:ecommerce/screen/home/home.dart';
import 'package:ecommerce/screen/login/sign.dart';
import 'package:ecommerce/screen/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyByeHKJUz8BeqbIbMjK0ExsWnUtoxBm1LU",
        // authDomain: "ecommerce-578b9.firebaseapp.com",
        projectId: "ecommerce-578b9",
        // storageBucket: "ecommerce-578b9.appspot.com",
        messagingSenderId: "851137586958",
        appId: "1:851137586958:web:1b7b709f6f62c93d3dd95f",
        // measurementId: "G-VTM9S50H8Q"
      ),
    );
  } else {
    await Firebase.initializeApp(
      options: DeafultfirebaseConfig.platformOptions,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: CustomAppTheme.themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Snapshot data");
            return SignInScreen();
          }
          return SignInScreen();
        },
      ),
    );
  }
}
