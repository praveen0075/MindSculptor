import 'package:flutter/material.dart';

pushReplacementNavigator({context,screenName}){
  return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
    return screenName;
  },));
}