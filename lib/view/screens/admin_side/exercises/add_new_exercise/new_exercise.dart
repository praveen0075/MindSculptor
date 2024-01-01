import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/add_new_exercise/widgets/exercuse_card.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/add_new_exercise/widgets/step_display_widget.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/imagepicker_function.dart';
import 'package:mind_sculptor/view/screens/authentication/widgets/widgets.dart';
import 'package:mind_sculptor/view/widgets/snackbar.dart';

class NewExerciseScreen extends StatefulWidget {
  const NewExerciseScreen({super.key});

  @override
  State<NewExerciseScreen> createState() => _NewExerciseScreenState();
}

class _NewExerciseScreenState extends State<NewExerciseScreen> {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController exerciseInstructionController =
      TextEditingController();
  String? selectedImage;
  String? selectedImageForExercise;
  String? instructionText;
  String? titleOfExercise;
  List<StepsOfExerciseModel> tempList = [];

  @override
  void initState() {
    super.initState();
    ExerciseDb.getExersise();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tc1,
        title: const Text('New Exercise'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.done),
                onPressed: () {
                  saveExercisesToHive();
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return  StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
              actions: [
                ElevatedButton(
                    onPressed: () {
                      addExerciseToList();
                      selectedImageForExercise = null;
                      Navigator.pop(context);
                    },
                    child: const Text('Save')),
                OutlinedButton(
                    onPressed: () {
                      exerciseInstructionController.clear();
                      selectedImageForExercise = null;
                    },
                    child: const Text('Clear'))
              ],
              elevation: 100,
              shadowColor: Colors.black,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.white,
              title: const Text(
                'Instruction',
                textAlign: TextAlign.center,
              ),
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Type here...'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: exerciseInstructionController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () async {
                              final imagePath = await collectImage();
                              if (imagePath != null) {
                              setState(() {
                                 selectedImageForExercise = imagePath;
                              },);
                               
                              }
                            },
                          child: Container(
                            width: double.maxFinite,
                            height: 200,
                            decoration: BoxDecoration(
                              image: selectedImageForExercise != null ? DecorationImage(image: FileImage(File(selectedImageForExercise!)),fit: BoxFit.cover):null,
                              border: Border.all()
                            ),
                            child: const Center(child: Icon(Icons.add_photo_alternate_outlined)),
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            );
              },) ;
            },
          );
          // screenNavigation(context: context,key: const AddInstructionsScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [tc1, lg1, lg1, lg2],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  exerciseCard(
                      descriptionController: descriptionController,
                      titleTextController: titleTextController,
                      pickImage: pickImage,
                      selectedImage: selectedImage),
                  divider(color: Colors.black26, thickness: 1),
                  TempListDisplayWidget(tempList: tempList),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Functions//
  
    Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path).path;
      });
    }
  }

  void addExerciseToList() async {
    instructionText = exerciseInstructionController.text.trim();
    if (instructionText == null && selectedImageForExercise == null) {
      showSnackbar(context, bgColor: Colors.red, text: 'Add an instruction');
    } else if (selectedImageForExercise == null) {
      showSnackbar(context,
          bgColor: Colors.red, text: 'Add both step and image');
    } else if (instructionText == null) {
      showSnackbar(context,
          bgColor: Colors.red, text: 'Add both step and image');
    } else {
      final StepsOfExerciseModel model = StepsOfExerciseModel(
          imageOfStep: selectedImageForExercise!, stepText: instructionText);
      tempList.add(model);
      setState(() {
      });
    }
    exerciseInstructionController.clear();
    instructionText == null;
    selectedImageForExercise = null;
  }

  void saveExercisesToHive() async {
    titleOfExercise = titleTextController.text.trim();
    if (selectedImage == null) {
      showSnackbar(context,
          bgColor: Colors.red, text: 'Add image to the exercise card');
    } else if (titleOfExercise == null) {
      showSnackbar(context, bgColor: Colors.red, text: 'Title is not added');
    } else {
      var newExercises = NewExercises(
        title: titleTextController.text.trim(),
        description: descriptionController.text.trim(),
        cardImage: selectedImage!,
      );
      if (tempList.isNotEmpty) {
        await ExerciseDb.addExercise(newExercises, tempList);
        await ExerciseDb.getExersise();
      }
      // ignore: use_build_context_synchronously
      showSnackbar(context, bgColor: Colors.green, text: 'saved succesfully');
      setState(() {
        tempList.clear();
        titleTextController.clear();
        selectedImage = null;
        descriptionController.clear();
      });
    }
  }

  void editStepsImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        tempList[index].imageOfStep = File(pickedImage.path).path;
      });
    }
  }

}
