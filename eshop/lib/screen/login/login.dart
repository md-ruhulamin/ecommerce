// ignore_for_file: prefer_const_constructors
import 'package:eshop/constrains/routes.dart';
import 'package:eshop/screen/home/home.dart';
import 'package:eshop/screen/sign_up/signup.dart';
import 'package:eshop/widget/top-title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      // Sign-in successful; navigate to another screen, e.g., home screen.
    } catch (e) {
      // Handle sign-in errors and display an error message.
      print('Sign-in error: $e');
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
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), hintText: "Email "),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
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
                onPressed: () => _signInWithEmailAndPassword(context),
                child: Center(child: Text("Login"))),
          
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
