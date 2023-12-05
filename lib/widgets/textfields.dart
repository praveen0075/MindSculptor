import 'package:flutter/material.dart';

Widget appTextField({
  double? radi,
  Color? fcolor,
  double? fieldradi,
  String? hint,
  IconData? icon,
  Color? iconClr,
  TextEditingController? txtcntrlr
}) {
  return  Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radi!))),
    elevation: 10,
    child: TextField(
      controller: txtcntrlr,
      decoration: InputDecoration(
        fillColor: fcolor,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(fieldradi!)),
            borderSide: BorderSide.none),
        hintText: hint,
        prefixIcon: Icon(icon,color: iconClr,),
      ),
    ),
  );
}

Widget textInputFormField(
    {String? hintText, bool? obscure, IconData? fieldIcon,TextEditingController? txtcontroller,String? Function(String?)? validatorFunction}) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: TextFormField(
      controller: txtcontroller,
      validator: validatorFunction,
      obscureText: obscure!,
      decoration: InputDecoration(
          prefixIcon: Icon(fieldIcon),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20))),
    ),
  );
}
