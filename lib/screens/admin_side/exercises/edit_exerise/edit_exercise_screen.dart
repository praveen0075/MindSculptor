import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/controller/exercise/exercise_steps_db.dart';
import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';
import 'package:mind_sculptor/widgets/snackbar.dart';

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
        title: const Text(
          'Edit Exercise',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                saveEditedExerciseOfDb();
                // saveEditedExStepsOfDb();
              },
              icon: Icon(Icons.done))
        ],
        backgroundColor: Colors.grey.shade100,
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
                            print(stepsList.length);
                            return ListView.builder(
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
                                      child: Column(
                                        children: [
                                          TextField(
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            controller: TextEditingController(
                                                text: stepListData.stepText),
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
                                              child: Image(
                                                image: FileImage(File(
                                                    stepListData.imageOfStep ??
                                                        '')),
                                                fit: BoxFit.cover,
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
                                );
                              },
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
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       elevation: 0,
//       title: Text(''
//         // widget.exercises.title,
//         ,style: const TextStyle(color: Colors.black),
//       ),
//       centerTitle: true,
//       backgroundColor: Colors.transparent,
//       iconTheme: const IconThemeData(color: Colors.black),
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ScrollConfiguration(
//         behavior: const ScrollBehavior().copyWith(overscroll: false),
//         child: ValueListenableBuilder(
//           valueListenable: exerciseNotifier,
//           builder: (context, value, child) {
//             return ListView.builder(
//               itemCount: 2,
//               itemBuilder: (context, index){
//                 var instrucntionTodisplay = value[index];
//                 return SingleChildScrollView(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             controller: TextEditingController(
//                               text: instrucntionTodisplay.steps[index],
//                             ),
//                             onChanged: (value) {
//                               updateStep(index, value);
//                             },
//                             decoration: InputDecoration(
//                                 border: const OutlineInputBorder(),
//                                 labelText: 'step ${index + 1}'),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               InkWell(
//                                 onTap: () async {
//                                   final picker = ImagePicker();
//                                   final pickedImage = await picker.pickImage(
//                                       source: ImageSource.gallery);
//                                           if (pickedImage != null) {
//                                   setState(() {
//                                       updateExerciseImage(
//                                           index, File(pickedImage.path));
//                                   });}
//                                 },
//                                 child: SizedBox(
//                                     height: 200,
//                                     width: 200,
//                                     child: Image.file(
//                                         File(instrucntionTodisplay.imageSteps[index]))),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                 );
//               }
//             );
//           } ,
//         )
//       ),
//     ),
//   );
// }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/constants/constv.dart';
// import 'package:mind_sculptor/controller/exercise/exercisedb_functions.dart';
// import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

// class EditExerciseScreen extends StatefulWidget{
//    EditExerciseScreen({super.key, required this.exercises});
//    NewExercises exercises;
//   @override
//   State<EditExerciseScreen> createState() => _EditExerciseScreenState();
// }

// class _EditExerciseScreenState extends State<EditExerciseScreen> {
//   @override
//   void initState() {
//     super.initState();
//     ExerciseDb.getExersise();
//   }

//   TextEditingController stepController = TextEditingController();
//   File? editedImage;

//   void updateStep(int index, String newStep) {
//     // NewExercises editexercises = widget.exercises;
//     // editexercises.steps[index] = newStep;
//   }

//   void updateExerciseImage(int index, File newImage) {
//     setState(() {
//       // widget.exercises.imageSteps[index] = newImage.path;
//     });
//   }

//   void updateTitle(String newValue){
//     setState(() {
//       widget.exercises.title = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade100,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 150,
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(

//                               height: 70,
//                               width: 70,
//                               decoration: BoxDecoration(
//                                  color: Colors.grey,
//                                 image: DecorationImage(image: FileImage(File(widget.exercises.cardImage)))
//                               ),
//                               child: const Icon(Icons.image)),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 180,
//                                   child: TextField(
//                                     textAlign: TextAlign.left,
//                                     controller: TextEditingController(
//                                       text: widget.exercises.title,
//                                     ),
//                                     onChanged: (newValue){
//                                       updateTitle(newValue);
//                                     },
//                                     decoration: const InputDecoration.collapsed(
//                                         hintText: 'Title'),
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17),
//                                   ),
//                                 ),
//                                 sizedBox10,
//                                 SizedBox(
//                                   width: 250,
//                                   child: TextField(
//                                     textAlign: TextAlign.left,
//                                     controller: TextEditingController(
//                                         text:
//                                             widget.exercises.description),
//                                     decoration: const InputDecoration.collapsed(
//                                         hintText: 'Description'),
//                                     style: const TextStyle(fontSize: 15),
//                                   ),
//                                 ),
//                                 sizedBox10,
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const Text('Edit Instructions'),
//             sizedBox10,
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   // color: Colors.blue,
//                   width: double.infinity,
//                   child: ListView.builder(
//                     itemCount: widget.exercises.steps.length,
//                     itemBuilder: (context, index) => Column(
//                       children: [
//                         TextField(
//                           controller: TextEditingController(
//                               text:
//                                   widget.exercises.steps[index]),
//                           keyboardType: TextInputType.multiline,
//                           maxLines: null,
//                           decoration: const InputDecoration.collapsed(
//                               hintText: 'instructions'),
//                           onChanged: (changedValue) {

//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20, bottom: 20),
//                           child: Stack(
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(image: FileImage(File(widget.exercises.imageSteps[index]))),
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(10)),
//                                   height: 190,
//                                   width: 250,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                               Positioned(
//                                   right: 5,
//                                   bottom: 5,
//                                   child: CircleAvatar(
//                                     child: InkWell(
//                                         onTap: () {},
//                                         child: const Icon(Icons.edit_outlined)),
//                                   ))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//             // ListView.builder(
//             //   itemCount: 2,
//             //   itemBuilder: (context, index) => Column(
//             //   children: [
//             //     TextField(
//             //       decoration: InputDecoration.collapsed(hintText: 'helllsdajfs'),
//             //     )
//             //   ],
//             // ),)
//           ],
//         ),
//       ),
//     );
//   }
// }

// void updateStep(int index, String newStep) {
//   // NewExercises editexercises = widget.exercises;
//   // editexercises.steps[index] = newStep;
// }

// void updateExerciseImage(int index, File newImage) {
//   setState(() {
//     // widget.exercises.imageSteps[index] = newImage.path;
//   });
// }

// void updateTitle(String newValue){
//   setState(() {
//     // widget.exercises.title = newValue;
//   });
// }
