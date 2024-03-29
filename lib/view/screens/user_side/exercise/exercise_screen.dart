import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/view/screens/user_side/exercise/exercise_displaye_screen.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  void initState() {
    super.initState();
    ExerciseDb.getExersise();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: tc1),
        centerTitle: true,
        elevation: 0,
        backgroundColor: tc1,
        title: Text('Exercises',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
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
          child: ValueListenableBuilder(
            valueListenable: exerciseNotifier,
            builder: (context, exerciseList, child) {
              if(exerciseList.isEmpty){
                return const Center(child: Text('No Exercises Available!',style: TextStyle(color: Colors.white),),);
              }else{
              return  ListView.builder(
              shrinkWrap: true,
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                var exercise = exerciseList[index];
                return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                screenNavigation(context: context,screen: ExerciseDisplayScreen(exercises: exercise,));
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
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Image.file(
                                              File(exercise.cardImage),
                                              fit: BoxFit.cover,
                                            ),
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
              }
            },
          ),
        ),
      ),
    );
  }
}
 