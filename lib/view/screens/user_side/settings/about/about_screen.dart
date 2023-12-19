import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/view/screens/user_side/settings/about/about_text.dart';

class AbooutScreen extends StatelessWidget {
  const AbooutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
         title:  Text('About',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black)),
         centerTitle: true,
         backgroundColor: Colors.white,
         elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(aboutText),
          ),
        ),
      ),
    );
  }
}