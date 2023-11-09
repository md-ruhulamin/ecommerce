// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors, avoid_types_as_parameter_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(content: Builder(builder: (context) {
    return SizedBox(
      width: 100,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 7),
          child: Text('Loading....'),
        )
      ]),
    );
  }));

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "1001":
      return "Invalid Email";

    case "1002":
      return "Invalid Password";
    case "1003":
      return "User Not Found";
    case "1004":
      return "User Already Exists";

    case "1005":
      return "User Not Authorized";

    case "1006":
      return "User Not Authorized";

    case "1007":
      return "User Not Authorized";

    case "1008":
      return "User Not Authorized";

    case "1009":
      return "User Not Authorized";

    case "1010":
      return "User Not Authorized";
    default:
      return "Login failed";
  }
}

bool loginValidation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Email and PassWord is required");
    return false;
  } else if (email.isEmpty) {
    showMessage('Email is Empty');
    return false;
  } else if (password.isEmpty) {
    showMessage("PassWord is Empty");
    return false;
  } else {
    return true;
  }
}

bool signUpValidation(
    String name, String email, String password, String phoneNumber) {
  if (name.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      phoneNumber.isEmpty) {
    if (name.isEmpty) {
      showMessage('Name is Empty');
    }
    if (email.isEmpty) {
      showMessage('Email is Empty');
    }
    if (password.isEmpty) {
      showMessage('Password is Empty');
    }
    if (phoneNumber.isEmpty) {
      showMessage('Phone Number is Empty');
    }
    return false;
  }

  //  else if (!_isValidEmail(email)) {
  //   showMessage('Invalid Email Format');
  //   return false;
  // }

  else if (!_isValidPhoneNumber(phoneNumber)) {
    showMessage('Invalid Phone Number Format');
    return false;
  } else {
    return true;
  }
}

bool _isValidEmail(String email) {
  // You can implement your email validation logic here.
  // For a simple example, check if it contains the "@" symbol.
  return email.contains('@');
}

bool _isValidPhoneNumber(String phoneNumber) {
  // You can implement your phone number validation logic here.
  // For a simple example, check if it contains only digits and has a certain length.
  if (phoneNumber.length == 11) {
    return true;
  } else {
    return false;
  }
}
