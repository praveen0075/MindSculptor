import 'package:flutter/material.dart';

Widget appTextField({
  double? radi,
  Color? fcolor,
  double? fieldradi,
  String? hint,
  IconData? icon,
  Color? iconClr,
  TextEditingController? txtcntrlr,
  EdgeInsetsGeometry? conntentpadding, 
}) 
{
  return  SizedBox(
    // height: 100,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radi!)),side: const BorderSide(style: BorderStyle.solid,width: 2)),
      elevation: 10,
      child: TextField(
        minLines: 2,
        maxLines: 2,
        controller: txtcntrlr,
        decoration: InputDecoration(
          contentPadding: conntentpadding,
          fillColor: fcolor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(fieldradi!)),
            ),
          hintText: hint,
          // prefixIcon: Icon(icon,color: iconClr,),
        ),
      ),
    ),
  );
}

Widget textInputFormField(
    {String? hintText, bool? obscure, IconData? fieldIcon,TextEditingController? txtcontroller,String? Function(String?)? validatorFunction}) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
