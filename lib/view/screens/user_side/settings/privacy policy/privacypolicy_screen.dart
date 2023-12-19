import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/privacy%20policy/policy_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
         title:  Text('Privacy policy',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black)),
         centerTitle: true,
         backgroundColor: Colors.white,
         elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(privacyPolicy),
          ),
        ),
      )
    );
  }
}