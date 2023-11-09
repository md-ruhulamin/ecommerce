// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:eshop/screen/login/login.dart';
import 'package:eshop/widget/top-title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _pNumber = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signUpWithEmailAndPassword(BuildContext context) async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Sign-up successful; navigate to the sign-in screen.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } catch (e) {
      // Handle sign-up errors and display an error message.
      print('Sign-up error: $e');
    }
  }

  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                  title: 'Create Account',
                  subtitle: 'Welcome To Our eCommerce App'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), hintText: "Name "),
              ),
              SizedBox(
                height: 20,
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
                controller: _pNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone), hintText: "Phone Number "),
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
                height: 20,
              ),
              CupertinoButton(
                  color: Colors.blue,
                  onPressed: () => _signUpWithEmailAndPassword(context),
                  child: Center(child: Text("Sign Up"))),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  //    Routes.instance.push(widget: const Body(), context: context);
                },
                child: Center(
                  child: Text("Already Have an Account?Login"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
