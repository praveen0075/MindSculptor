import 'dart:io';

import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    ExecriseStepsDb.getStepsOfExcerise(widget.exercises.key);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Exercises',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ValueListenableBuilder(
            valueListenable: stepsListNotifer,
            builder: (context, stepList, child) {
              return ListView.builder(
              itemCount: stepList.length,
              itemBuilder: (context, index) {
                StepsOfExerciseModel instructions = stepList[index];
                print('step list ${stepList.toList()}');;
                return Column(
                  children: [
                    Text(instructions.stepText!),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.file(File(instructions.imageOfStep!)),
                    ),
                  ],
                );
              },
            );
            },
          ),
        ));
  }
}
