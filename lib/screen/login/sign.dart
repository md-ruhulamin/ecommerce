import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        setState(() {
          _errorText = 'Email and password are required.';
        });
        return;
      }

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Sign-in successful
      // Navigate to the next screen or perform other actions.
    } catch (e) {
      setState(() {
        switch (e.toString()) {
          case 'firebase_auth/user-not-found':
            _errorText = 'No user found with this email address.';
            break;
          case 'firebase_auth/wrong-password':
            _errorText = 'Incorrect password. Please try again.';
            break;
          case 'firebase_auth/invalid-email':
            _errorText = 'Invalid email address. Please check the format.';
            break;
          case 'firebase_auth/user-disabled':
            _errorText = 'Your account has been disabled. Contact support.';
            break;
          default:
            _errorText = 'An error occurred. Please try again later.';
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text('Sign In'),
            ),
            if (_errorText.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  _errorText,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
