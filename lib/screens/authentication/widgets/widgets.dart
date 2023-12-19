import 'package:flutter/material.dart';
// divider

Widget divider({double? thickness, Color? color}) {
  return Divider(
    thickness: 1,
    color: color,
  );
}

// Already have an account Text(authentication)

Widget orTextForLogInAndSignUp({String? text, Color? textColor}) {
  return Text(
    text!,
    style: const TextStyle(color: Colors.grey ),
  );
}

// sign up or login

Widget signUpOrLoginText({String? text}) {
  return  Text(
    text!,
    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  );
}
