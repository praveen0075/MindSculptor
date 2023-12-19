import 'package:flutter/material.dart';

showSnackBar({BuildContext? context,Color? textcolor,Color? backgroundColor}) {
  return ScaffoldMessenger.of(context!).showSnackBar(
     SnackBar(
      content: Text(
        'Inavlid Username and Password',
        style: TextStyle(color: textcolor),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
