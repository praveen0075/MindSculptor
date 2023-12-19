import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/db_functions/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
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
    }
    else if(selectedImageForExercise == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Add both step and image');
    }else if(instructionText == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Add both step and image');
    }
    else {
      final StepsOfExerciseModel model = StepsOfExerciseModel(
          imageOfStep: selectedImageForExercise!, stepText: instructionText);
      tempList.add(model);
      setState(() {
        //  exerciseSteps.add(instructionText!);
        //  exerciseImages.add(selectedImageForExercise!);
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
      showSnackbar(context, bgColor: Colors.green, text: 'saved succesfully');
      setState(() {
        tempList.clear();
        titleTextController.clear();
        selectedImage = null;
        descriptionController.clear();
      });
    }
  }

  void editinstruction(int index, String instruction) {
    tempList[index].stepText = instruction;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                ElevatedButton(
                    onPressed: () {
                      addExerciseToList();
                      selectedImageForExercise = null;
                    },
                    child: const Text('Save')),
                OutlinedButton(
                    onPressed: () {
                      exerciseInstructionController.clear();
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
                        child: ElevatedButton(
                            onPressed: () async {
                              final imagePath = await collectImage();
                              if (imagePath != null) {
                                selectedImageForExercise = imagePath;
                              }
                            },
                            child: const Text('Click here to Add Image')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          // screenNavigation(context: context,key: const AddInstructionsScreen());
        },
        child: const Icon(Icons.add),
      ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: selectedImage != null
                                        ? DecorationImage(
                                            image:
                                                FileImage(File(selectedImage!)),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    color: Colors.grey,
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        pickImage();
                                      },
                                      child: const Icon(
                                          Icons.add_photo_alternate_outlined)),
                                ),
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            decoration: const InputDecoration(
                                              hintText: 'Title',
                                            ),
                                            controller: titleTextController,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            decoration: const InputDecoration(
                                              hintText: 'Description',
                                            ),
                                            controller: descriptionController,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  divider(color: Colors.black26, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: tempList.isEmpty
                        ? const Center(child:  Text('No instructions added',style: TextStyle(color: Colors.white),))
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView.separated(
                                itemBuilder: (context, index) => Container(
                                  decoration: BoxDecoration(
                                    border: Border.all()
                                  ),
                                  child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: tempList[index].stepText),
                                              keyboardType: TextInputType.multiline,
                                              maxLines: null,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              onChanged: (changedValue) {
                                                editinstruction(
                                                    index, changedValue);
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            child: Stack(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10)),
                                                    height: 190,
                                                    width: 250,
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                        child: Image(
                                                          image: FileImage(File(
                                                              tempList[index]
                                                                  .imageOfStep!)),
                                                          fit: BoxFit.cover,
                                                        ))),
                                                Positioned(
                                                    right: 5,
                                                    bottom: 5,
                                                    child: CircleAvatar(
                                                      child: InkWell(
                                                          onTap: () {
                                                            editStepsImage(index);
                                                          },
                                                          child: const Icon(Icons
                                                              .edit_outlined)),
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                ),
                                separatorBuilder: (context, index) =>
                                    sizedBox10,
                                itemCount: tempList.length)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
