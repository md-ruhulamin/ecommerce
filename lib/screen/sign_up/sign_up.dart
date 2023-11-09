// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pNumber = TextEditingController();
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
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person), hintText: "Name "),
              ),
              SizedBox(
                height: 20,
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
                controller: pNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone), hintText: "Phone Number "),
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
                height: 20,
              ),
              CupertinoButton(
                  color: Colors.blue,
                  onPressed: () async {
                    bool isValided = signUpValidation(
                        name.text.trim(),
                        email.text.trim(),
                        password.text.trim(),
                        pNumber.text.trim());

                    if (isValided) {
                      bool isLogin = await FirebaseAuthHelper.instance.signUp(
                          email.text.trim(), password.text.trim(), context);

                      if (isLogin) {
                        showMessage("Sign up to Firebase");
                        Routes.instance.push(widget: Home(), context: context);
                      }
                    }
                  },
                  child: Center(child: Text("Sign Up"))),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
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
