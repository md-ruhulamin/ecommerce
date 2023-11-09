// ignore_for_file: prefer_const_constructors
import 'package:eshop/firebase_helper/firebase_authhelper/firebase_auth_helper.dart';
import 'package:eshop/screen/home/home.dart';
import 'package:eshop/screen/welcomepage.dart';
import 'package:eshop/widget/mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBWcCKBzV17qnqt9PkGquX7ZP5kVMp26k8",
        authDomain: "eshop-fce37.firebaseapp.com",
        projectId: "eshop-fce37",
        storageBucket: "eshop-fce37.appspot.com",
        messagingSenderId: "873534882666",
        appId: "1:873534882666:web:8eb5801f20bd6b19d75b13",
        measurementId: "G-5989QCZKNM"),
  );
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
            return Home();
          }
          return Home();
        },
      ),
    );
  }
}
