import 'package:flutter/material.dart';

navigation({context, key}) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  key,
      ));
}

  
