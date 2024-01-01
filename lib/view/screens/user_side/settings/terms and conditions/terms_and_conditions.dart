import 'package:flutter/material.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/terms%20and%20conditions/text_of_terms.dart';

class TermsAndCondtions extends StatelessWidget {
  const TermsAndCondtions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Terms & Condtions',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child:  Padding(
          padding:  const EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: Text(termsAndConditons)),
        ),
      ),
    );
  }
}