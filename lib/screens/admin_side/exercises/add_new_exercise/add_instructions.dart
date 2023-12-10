import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';

class AddInstructionsScreen extends StatelessWidget {
  const AddInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: tc1,
        title: const Text('Add Instructios'),
        centerTitle: true,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
         decoration: const BoxDecoration(    
              gradient: LinearGradient(
                colors: [tc1, lg1, lg1, lg2],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Container(
                 
              ),
            ),
      ),
    );
  }
}