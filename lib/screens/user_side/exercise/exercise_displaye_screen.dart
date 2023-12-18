import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/controller/exercise/exercise_steps_db.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

class ExerciseDisplayScreen extends StatefulWidget {
  const ExerciseDisplayScreen({super.key, required this.exercises});
  final NewExercises exercises;

  @override
  State<ExerciseDisplayScreen> createState() => _ExerciseDisplayScreenState();
}

class _ExerciseDisplayScreenState extends State<ExerciseDisplayScreen> {
  @override
  void initState() {
    super.initState();
    ExecriseStepsDb.getStepsOfExcerise(widget.exercises.key);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: tc1,
          title: Text(
            widget.exercises.title,style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors:[tc1,lg1, lg1, lg2],begin: Alignment.topCenter,end: Alignment.bottomCenter)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ValueListenableBuilder(
                valueListenable: stepsListNotifer,
                builder: (context, stepList, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollConfiguration(
                      behavior: const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return sizedBox10;
                        },
                      itemCount: stepList.length,
                      itemBuilder: (context, index) {
                        StepsOfExerciseModel instructions = stepList[index];
                        return Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    // child: Text("'step ${index + 1}' : '${instructions.stepText!}'",
                                    child: Text(instructions.stepText!,
                                    textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontFamily: GoogleFonts.publicSans().fontFamily))),
                                ),
                                  sizedBox10,
                                SizedBox(
                                   height: 150,
                                   width: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(File(instructions.imageOfStep!),fit: BoxFit.cover,)),
                                ),
                                sizedBox20
                              ],
                            ),
                          ),
                        );
                      },
                                  ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
