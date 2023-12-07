import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/edit_exercise.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/new_exercise.dart';
import 'package:mind_sculptor/screens/admin_side/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/constants/constv.dart';

class ExerciseAdmin extends StatefulWidget {
  const ExerciseAdmin({super.key});

  @override
  State<ExerciseAdmin> createState() => _ExerciseAdminState();
} 

class _ExerciseAdminState extends State<ExerciseAdmin> {
  late Box<NewExercises> exerciseBox;
  @override
  void initState() {
    super.initState();
    ExerciseDb.getExersise();
  }

  void deletExercise(int index) { 
    ExerciseDb.deleteExercise(index);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          screenNavigation(context: context, key: const NewExerciseScreen());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tc1, 
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [tc1, lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 720,
                  child: ValueListenableBuilder(
                    valueListenable: exerciseNotifier,
                    builder: (context, exerciseList, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: exerciseList.length,
                        itemBuilder: (context, index) {
                          var exercise = exerciseList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                screenNavigation(
                                    context: context,
                                    key: EditExerciseScreen(
                                        exercises: exercise));
                              },
                              child: SizedBox(
                                height: 150,
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          width: 70,
                                          child: Image.file(
                                            File(exercise.cardImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(crossAxisAlignment:CrossAxisAlignment.center,
                                          mainAxisAlignment:MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                exercise.title,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                textAlign: TextAlign.center,
                                              ),
                                            sizedBox10,
                                              Text(
                                                exercise.description,
                                                textAlign: TextAlign.center,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        showDeleteDialog(index, context, () {
                                                          deletExercise(index);
                                                        });
                                                      },
                                                      child: const Icon(Icons.delete)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
