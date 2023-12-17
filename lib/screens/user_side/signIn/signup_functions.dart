
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

  void userAlreadyExist()async{
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool('userEntered',true);
  }

  bool validateEmailaddress(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}
