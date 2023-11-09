// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/constrains/constants.dart';
import 'package:ecommerce/firebase_helper/firebase_authhelper/firebase_auth_helper.dart';
import 'package:ecommerce/screen/home/home.dart';
import 'package:ecommerce/screen/sign_up/sign_up.dart';
import 'package:ecommerce/widget/top_titles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constrains/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      // User signed in successfully, handle the logged-in user here
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sign-in successful
      print('Sign-in successful');
    } catch (e) {
      print('Sign-in error: $e');
      // Handle sign-in errors here, such as displaying an error message to the user.
    }
  }

  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(
                title: 'Login', subtitle: 'Welcome Back To eCommerce App'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), hintText: "Email "),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              obscureText: ishidden,
              decoration: InputDecoration(
                  suffixIcon: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          ishidden = !ishidden;
                        });
                      },
                      child: ishidden
                          ? Icon(Icons.visibility_off)
                          : Icon(
                              Icons.visibility,
                            )),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password_outlined)),
            ),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
                color: Colors.blue,
                onPressed: () async {
                  bool isValidated = true;

                  if (isValidated) {
                    print("Validated $isValidated");
                    bool isLogin = await FirebaseAuthHelper.instance.login(
                        email.text.trim(), password.text.trim(), context);

                    if (isLogin) {
                      showMessage("Logged in to Firebase");
                      Routes.instance.push(widget: Home(), context: context);
                    }
                  }
                },
                child: Center(child: Text("Login"))),
            ElevatedButton(
              onPressed: () {
                // Replace 'email' and 'password' with the user's input
                signInWithEmailAndPassword('ruhul@gmail.com', '1234');
              },
              child: Text('Sign In'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Center(child: Text("Forget Password?"))),
            SizedBox(
              height: 1,
            ),
            CupertinoButton(
                onPressed: () {
                  Routes.instance.pushAndRemoveUntil(
                      widget: const SignUp(), context: context);
                },
                child: Center(child: Text("Create New Account")))
          ],
        ),
      ),
    );
  }
}
