import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/imagepicker_function.dart';
import 'package:mind_sculptor/widgets/snackbar.dart';

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
  List<String> exerciseSteps = [];
  List<String> exerciseImages = [];
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
        selectedImage = pickedImage.path;
      });
    }
  }

  Future<void> pickImageForExercise() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImageForExercise = pickedImage.path;
      });
    }
  }

  void addExerciseToList() async{
    instructionText = exerciseInstructionController.text.trim();
    if(instructionText == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Text is not added');
    }else if(selectedImageForExercise == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Add an image');
    }else{
      setState(() {
         exerciseSteps.add(instructionText!);
         exerciseImages.add(selectedImageForExercise!);
      });
    }
    exerciseInstructionController.clear();
    selectedImageForExercise == null;
  }

  void saveExercisesToHive()async{
    titleOfExercise = titleTextController.text.trim();
    if(selectedImage == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Add image to the exercise card');
    }else if(titleOfExercise == null){
      showSnackbar(context,bgColor: Colors.red,text: 'Title is not added');
    }else{
       var newExercises = NewExercises(
        exerciseSteps,
        exerciseImages,
        title: titleTextController.text.trim(),
        description: descriptionController.text.trim(),
        cardImage: selectedImage!,
      );
      await ExerciseDb.addExercise(newExercises);
      await ExerciseDb.getExersise();
      showSnackbar(context,bgColor: Colors.green,text: 'saved succesfully');
      setState(() {
          exerciseSteps.clear();
      exerciseImages.clear();
      titleTextController.clear();
      selectedImage = null;
      descriptionController.clear();
      });
    }
  }

  // void saveExercisesToHive() async {
  //   if (selectedImage != null) {
  //     var newExercises = NewExercises(
  //       exerciseSteps,
  //       exerciseImages,
  //       title: titleTextController.text.trim(),
  //       description: descriptionController.text.trim(),
  //       cardImage: selectedImage!,
  //     );
  //     await ExerciseDb.addExercise(newExercises);
  //     await ExerciseDb.getExersise();
  //   } else {
  //     showSnackbar(context, text: 'Add an exercise image', bgColor: Colors.red);
  //   }
  // }

  void editinstruction(int indext,String instruction){
    exerciseSteps[indext] = instruction;
  }

  // void editStepsImage(int index, String instructionImage){
  //   pickImageForExercise();
  //   setState(() {
  //     exerciseImages[index] = instructionImage;
  //   });
  // }

  void editStepsImage(int index) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      exerciseImages[index] = pickedImage.path;
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
                ElevatedButton(onPressed: () {
                  addExerciseToList();
                }, child: const Text('Save')),
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
                'Step 1',
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
        actions:  [
          Padding(
            padding:const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.done),
                onPressed: (){
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  ),
                  divider(color: Colors.black26, thickness: 1),
                  const Text(
                    'Add Instructions',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.separated(
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    TextField(
                                      controller: TextEditingController(text: exerciseSteps[index]),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      style:
                                          const TextStyle(color: Colors.white),
                                          onChanged: (changedValue){
                                            editinstruction(index, changedValue);
                                          },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      child: Stack(
                                        children: [
                                                  Container(
                                            decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                            height: 190,
                                            width: 250,
                                            child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image(
                                                    image: FileImage(File(
                                                        exerciseImages[index])),
                                                    fit: BoxFit.cover,
                                                  ))),
                                                   Positioned(
                                                    right: 5,
                                                    bottom: 5,
                                                    child:CircleAvatar(
                                                      child: InkWell(
                                                        onTap: (){
                                                          editStepsImage(index);
                                                        },
                                                        child: const Icon(Icons.edit_outlined)),
                                                    ))
                                                ],
                                      ),
                                    )
                                  ],
                                ),
                            separatorBuilder: (context, index) => sizedBox10,
                            itemCount: exerciseSteps.length)),
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

   // Column(
              //   children: [
              //     Text('Add Instructions',style: TextStyle(color: Colors.white),),
              //     SizedBox()
              //   ],
              // )
          //     Center(
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: SizedBox(
          //         height: 400,
          //         width: double.maxFinite,
          //         child: Card(
          //           shadowColor: Colors.grey,
          //           elevation: 20,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20)),
          //           child: SingleChildScrollView(
          //             child: Column(
          //               children: [
          //                   Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: TextField(
          //                         controller: exerciseInstructionController,
          //                       decoration: InputDecoration(
          //                         hintText: 'Type one Instruction',
          //                         border: OutlineInputBorder(
          //                           borderRadius: BorderRadius.circular(10)
          //                         )
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Container(
          //                       height: 200,
          //                       width: 200,
          //                       decoration:  BoxDecoration(
          //                         image: selectedImageForExercise != null ? DecorationImage(image: FileImage(selectedImageForExercise!)):null
          //                       ),
          //                       child: InkWell(
          //                         onTap: (){
          //                           pickImageForExercise();
          //                         },
          //                         child:  const Icon(Icons.add_photo_alternate_outlined,size: 40,)),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         ElevatedButton(onPressed: (){
          //                           String exerciseText = exerciseInstructionController.text;
          //                           String exerciseImage = selectedImageForExercise!.path;
          //                           setState(() {
          //                             if(exerciseText.isEmpty || exerciseImage.isEmpty){
          //                              showSnackbar(context,bgColor: Colors.green,text: 'Add both image and text'); 
          //                             }else{
          //                             exerciseSteps.add(exerciseInstructionController.text);
          //                             exerciseImages.add(selectedImageForExercise!.path);
          //                             exerciseInstructionController.clear();
          //                             selectedImageForExercise = null;
          //                             showSnackbar(context,bgColor: Colors.green,text: 'Instruction added');
          //                             }
          //                           });
          //                         }, child: const Text('Save')),
          //                         const SizedBox(width: 10,), 
          //                         ElevatedButton(onPressed: (){
          //                           exerciseInstructionController.clear() ;
          //                           setState(() {
          //                             selectedImageForExercise = null;
          //                           });
          //                         }, child: const Text('Clear'))
          //                       ],
          //                     ),
          //                   )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     ),
          //     SizedBox(
          // width: 200,
          // height: 50,
          // child: ElevatedButton(onPressed:(){
          //     saveExercisesToHive();
          //     titleTextController.clear();
          //     descriptionController.clear();
          //     setState(() {
          //       selectedImage = null;
          //     });
          //     showSnackbar(context,bgColor: Colors.green,text: 'Exercise added');
          // }, child: const Text('Finish')),
          //     )