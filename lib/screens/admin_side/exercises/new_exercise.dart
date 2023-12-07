import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/widgets/snackbar.dart';

class NewExerciseScreen extends StatefulWidget {  
  const NewExerciseScreen({super.key});

  @override
  State<NewExerciseScreen> createState() => _NewExerciseScreenState();
}

class _NewExerciseScreenState extends State<NewExerciseScreen> {
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController exerciseInstructionController = TextEditingController();
  File? selectedImage;
  File? selectedImageForExercise;
  String? instructionText;
  late Box<NewExercises> exerciseBox;
  List<String>exerciseSteps = [];
  List<String>exerciseImages = [];
  @override
  void initState() {
    super.initState();
    ExerciseDb.getExersise();
  }
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
      }
    });
  }
    Future<void> pickImageForExercise() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        selectedImageForExercise = File(pickedImage.path);
      }
    });
  }
    void saveExercisesToHive() async {
      if(selectedImage != null){
         var newExercises = NewExercises(
      exerciseSteps,
      exerciseImages,
      title: titleTextController.text.trim(),
      description: descriptionController.text.trim(),
      cardImage: selectedImage!.path,); 
      await ExerciseDb.addExercise(newExercises);
      await ExerciseDb.getExersise();
      }else{
        showSnackbar(context,text: 'Add an exercise image',bgColor: Colors.red);
      }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: tc1,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [tc1, lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, 
          ),
        ),
        child: SingleChildScrollView(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: selectedImage != null
                                  ? DecorationImage(
                                      image: FileImage(selectedImage!),
                                      fit: BoxFit.cover)
                                  : null,
                            ),
                            child: InkWell(
                                onTap: () {
                                  pickImage();
                                },
                                child: const Icon(
                                    Icons.add_photo_alternate_outlined)),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 400,
                  width: double.maxFinite,
                  child: Card(
                    shadowColor: Colors.grey,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: exerciseInstructionController,
                                decoration: InputDecoration(
                                  hintText: 'Type one Instruction',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration:  BoxDecoration(
                                  image: selectedImageForExercise != null ? DecorationImage(image: FileImage(selectedImageForExercise!)):null
                                ),
                                child: InkWell(
                                  onTap: (){
                                    pickImageForExercise();
                                  },
                                  child:  const Icon(Icons.add_photo_alternate_outlined,size: 40,)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    String exerciseText = exerciseInstructionController.text;
                                    String exerciseImage = selectedImageForExercise!.path;
                                    setState(() {
                                      if(exerciseText.isEmpty || exerciseImage.isEmpty){
                                       showSnackbar(context,bgColor: Colors.green,text: 'Add both image and text'); 
                                      }else{
                                      exerciseSteps.add(exerciseInstructionController.text);
                                      exerciseImages.add(selectedImageForExercise!.path);
                                      exerciseInstructionController.clear();
                                      selectedImageForExercise = null;
                                      showSnackbar(context,bgColor: Colors.green,text: 'Instruction added');
                                      }
                                    });
                                  }, child: const Text('Save')),
                                  const SizedBox(width: 10,), 
                                  ElevatedButton(onPressed: (){
                                    exerciseInstructionController.clear() ;
                                    setState(() {
                                      selectedImageForExercise = null;
                                    });
                                  }, child: const Text('Clear'))
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ),
              SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(onPressed:(){
              saveExercisesToHive();
              titleTextController.clear();
              descriptionController.clear();
              setState(() {
                selectedImage = null;
              });
              showSnackbar(context,bgColor: Colors.green,text: 'Exercise added');
          }, child: const Text('Finish')),
              )
            ],
          ),
        ),
      ),
    );
  }
}