
// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/screens/user_side/onboarding/on_boarding_screen.dart';
// import 'package:mind_sculptor/widgets/snackbar.dart';


import 'package:shared_preferences/shared_preferences.dart';

String? validateUsername(String? value) {
  if (value!.isEmpty) {
    return 'Please enter your username';
  } else {
    return null;
  }
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Enter an email address';
  }

  final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Enter a valid email address';
  }
  return null; // Return null if the email is valid
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a password';
  } else if (value.length < 5) {
    return 'Password must be at least 5 character';
  } else {
    return null;
  }
}

  // delaySignInScreen(context) async{
  //   await showSnackBar(context,clr: Colors.green,secnd: const Duration(milliseconds: 5),text: 'Success',txtColor: Colors.white);
  //   await Future.delayed(const Duration(seconds: 1));
  //    Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const OnBoardingScreen(),));
  // }

  void userAlreadyExist()async{
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool('userEntered',true);
  }

  bool validateEmailaddress(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}
