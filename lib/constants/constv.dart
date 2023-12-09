import 'package:flutter/material.dart';

//common colors.
const Color lg1 =  Colors.blue;
const Color lg2 = Colors.white;
const Color tc1 = Color.fromARGB(255, 61, 85, 195);
const Color tc2 = Color.fromARGB(255, 163, 198, 226);

// sizedbox with hight
const sizedBox10 = SizedBox(
  height: 10, 
);

const sizedBox30 = SizedBox(
  height: 30,
);

const sizedBox20 = SizedBox(
  height: 20,
);

const sizedBox40 = SizedBox(
  height: 40,
);

// divider

Widget divider({double? thickness,Color? color}){
  return Divider(
    thickness: 1,
    color: color ,
  );
}