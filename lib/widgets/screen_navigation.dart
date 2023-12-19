import 'package:flutter/material.dart';
//push replacement

pushReplacementNavigator({context,screenName}){
  return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
    return screenName;
  },));
}