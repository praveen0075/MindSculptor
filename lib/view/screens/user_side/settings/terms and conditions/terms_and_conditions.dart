import 'package:flutter/material.dart';

class TermsAndCondtions extends StatelessWidget {
  const TermsAndCondtions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Terms & Condtions'),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: const Padding(
          padding:  EdgeInsets.all(8.0),
          child: SingleChildScrollView(child: Text('kasdfkhkasdhfkhaskfhashdkhahr')),
        ),
      ),
    );
  }
}