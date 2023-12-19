import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercise_steps_db.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/view/widgets/snackbar.dart';

class EditExerciseScreen extends StatefulWidget {
  const EditExerciseScreen({
    super.key,
    required this.exercises,
  });
  final NewExercises exercises;
  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController exerciseStepsController;
  String? editedTitle;
  String? editedDescription;
  String? editedImage;
  String? editedInstructionImage;
  String? temperoryImage;
  @override
  void initState() {
    super.initState();
    // ExerciseDb.getExersise();
    ExecriseStepsDb.getStepsOfExcerise(widget.exercises.key);
  }

  Future<void> pickCardImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        editedImage = File(pickedImage.path).path;
      });
    }
  }

  Future<void> pickInstructionImage(StepsOfExerciseModel stepListData) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        editedInstructionImage = File(pickedImage.path).path;
        stepListData.imageOfStep = editedInstructionImage;
      });
    } else {
      null;
    }
  }

  void saveEditedExerciseOfDb() {
    var editeExercise = NewExercises(
        title: editedTitle ?? widget.exercises.title,
        description: editedDescription ?? widget.exercises.description,
        cardImage: editedImage ?? widget.exercises.cardImage,
        key: widget.exercises.key);
    ExerciseDb.updateExercise(editeExercise);
    showSnackbar(context,bgColor: Colors.green,text: 'Successfully Updated');
    Navigator.pop(context);
  }

  void saveEditedExStepsOfDb() {
    final list = stepsListNotifer.value;
    for (var step in list) {
      ExecriseStepsDb.updateExerciseSteps(step);
    }
  }

  void deleteExerciseStep(StepsOfExerciseModel stepListData) {
    ExecriseStepsDb.deleteExerciseStep(stepListData.stepKey);
    ExecriseStepsDb.getStepsOfExcerise(widget.exercises.key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Edit Exercise',
         style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily,color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                saveEditedExerciseOfDb();
                // saveEditedExStepsOfDb();
              },
              icon: const Icon(Icons.done))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              pickCardImage();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    image: editedImage == null
                                        ? DecorationImage(
                                            image: FileImage(
                                                File(widget.exercises.cardImage)),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: FileImage(File(editedImage!)),
                                            fit: BoxFit.cover),
                                    color: Colors.grey,
                                  ),
                                  child: const Icon(Icons.image)),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    controller: TextEditingController(
                                      text: widget.exercises.title,
                                    ),
                                    decoration: const InputDecoration.collapsed(
                                        hintText: 'Title'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    onChanged: (newValue) {
                                      editedTitle = newValue;
                                    },
                                  ),
                                ),
                                sizedBox10,
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    controller: TextEditingController(
                                        text: widget.exercises.description),
                                    decoration: const InputDecoration.collapsed(
                                        hintText: 'Description'),
                                    style: const TextStyle(fontSize: 15),
                                    onChanged: (newValue) {
                                      editedDescription = newValue;
                                    },
                                  ),
                                ),
                                sizedBox10,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text('Edit Instructions'),
            sizedBox10,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      // color: Colors.blue,
                      width: double.infinity,
                      child: ValueListenableBuilder(
                          valueListenable: stepsListNotifer,
                          builder: (context, stepsList, child) {
                            return ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(overscroll: false),
                              child: ListView.builder(
                                itemCount: stepsList.length,
                                itemBuilder: (context, index) {
                                  StepsOfExerciseModel stepListData =
                                      stepsList[index];
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all()),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              TextField(
                                                textAlign: TextAlign.left,style: TextStyle(fontSize: 15,fontFamily: GoogleFonts.publicSans().fontFamily),
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: null,
                                                controller: TextEditingController(
                                                    text: stepListData.stepText,),
                                                decoration:
                                                    InputDecoration.collapsed(
                                                        hintText:
                                                            'step ${index + 1}'),
                                                onChanged: (newValue) {
                                                  stepListData.stepText = newValue;
                                                },
                                              ),
                                              sizedBox20,
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 170,
                                                  width: 170,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child: Image(
                                                      image: FileImage(File(
                                                          stepListData.imageOfStep ??
                                                              '')),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Delete Exercise'),
                                                              content: const Text(
                                                                  'Are you sure you want to delete this exercise?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () async{
                                                                    
                                                                       deleteExerciseStep(
                                                                        stepListData);
                                                                   
                                                                   
                                                                    Navigator.pop(
                                                                        context);
                                                                        showSnackbar(context,bgColor: Colors.red,text: 'deleted successfully');
                                                                  },
                                                                  child: const Text(
                                                                      'Delete'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        // showDeleteDialog(
                                                        //             index, context, () {
                                                        //                 deleteExerciseStep(stepListData);
                                                        //         });
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete_outline)),
                                                  sizedBox40w,
                                                  sizedBox30w,
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        pickInstructionImage(
                                                            stepListData);
                                        
                                                        // setState(() {
                                        
                                                        //   stepListData.imageOfStep = editedInstructionImage;
                                                        // });
                                                      },
                                                      child: const Text(
                                                          'Change Image?')),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
