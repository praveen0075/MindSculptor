import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/edit_exerise/edit_exercise_screen.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/add_new_exercise/new_exercise.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/constants/constv.dart';

class ExerciseAdmin extends StatefulWidget {
  const ExerciseAdmin({super.key});

  @override
  State<ExerciseAdmin> createState() => _ExerciseAdminState();
}

class _ExerciseAdminState extends State<ExerciseAdmin> {
  @override
  void initState() {
    super.initState();
    ExerciseDb.getExersise();
  }

  void deletExercise(String key) {
    ExerciseDb.deleteExercise(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          screenNavigation(context: context, screen: const NewExerciseScreen());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tc1,
        title: const Text('Exercise'),
        centerTitle: true,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [tc1, lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
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
                          String key = exerciseList[index].key??'';
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                screenNavigation(
                                    context: context,
                                    screen:  EditExerciseScreen(exercises: exercise,));
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
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                exercise.title,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              sizedBox10,
                                              Text(
                                                exercise.description,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        showDeleteDialog(
                                                            index, context, () {
                                                          deletExercise(key);
                                                        });
                                                      },
                                                      child: const Icon(
                                                    Icons.delete)),
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
