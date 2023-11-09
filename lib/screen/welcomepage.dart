// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ecommerce/constrains/asset_images.dart';
import 'package:ecommerce/constrains/routes.dart';
import 'package:ecommerce/screen/login/login.dart';
import 'package:ecommerce/screen/sign_up/sign_up.dart';
import 'package:ecommerce/widget/button.dart';
import 'package:ecommerce/widget/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(
            //   height: kToolbarHeight + 12,
            // ),
            TopTitles(
              title: 'Welcome Buyer for Testing',
              subtitle: 'Buyanything From This Shop',
            ),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeimg,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 45,
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Image.asset(
                    AssetsImages.instance.googleicon,
                    scale: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              title: "Login",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              title: "Sign Up",
              onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
