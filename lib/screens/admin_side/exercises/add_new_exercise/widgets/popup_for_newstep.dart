// import 'package:flutter/material.dart';

// class PopUpForNewExercise extends StatelessWidget {
//   const PopUpForNewExercise({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return showDialog(context: context, builder: )
//     // return Alert(
//     //     context: context,
//     //     title: "LOGIN",
//     //     content: Column(
//     //       children: <Widget>[
//     //         TextField(
//     //           decoration: InputDecoration(
//     //             icon: Icon(Icons.account_circle),
//     //             labelText: 'Username',
//     //           ),
//     //         ),
//     //         TextField(
//     //           obscureText: true,
//     //           decoration: InputDecoration(
//     //             icon: Icon(Icons.lock),
//     //             labelText: 'Password',
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //     buttons: [
//     //       ElevatedButton(
//     //         onPressed: () => Navigator.pop(context),
//     //         child: Text(
//     //           "LOGIN",
//     //           style: TextStyle(color: Colors.white, fontSize: 20),
//     //         ),
//     //       )
//     //     ]).show();  
//   }
// }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/screens/admin_side/exercises/functions/imagepicker_function.dart';
// String ? imagePath;

// showPopForNewStep({context, required TextEditingController exerciseStepcontroller,}
// ) {
//   return showDialog(context: context, builder: (context) => AlertDialog(  
//     actions: [
//      ElevatedButton(onPressed: (){

//      }, child:const Text('Save')),
//      OutlinedButton(onPressed: (){}, child:const Text('Clear'))
//     ],
//     elevation: 100,
//     shadowColor: Colors.black,
//     shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     backgroundColor: Colors.white,
//     title: const Text('Step 1',textAlign: TextAlign.center,),
//     content: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       height: 280,
//       child:  SingleChildScrollView(
//         child:  Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: TextField(
//               decoration: const InputDecoration.collapsed(hintText: 'Type here...'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: null,
//                 controller: exerciseStepcontroller,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                       image: imagePath != null
//               ? DecorationImage(
//                   image: FileImage(File(imagePath!)),
//                   fit: BoxFit.cover,
//                 )
//               : null,
//                   border: Border.all(),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 margin: const EdgeInsets.only(top: 10),
//                 height: 200,
//                 width: double.maxFinite,
//                 child: InkWell(
//                   onTap: ()async{
//                    String? pickedImagePath = await collectImage();
//                    if(pickedImagePath != null){
//                     imagePath = pickedImagePath;
//                    }
//                   },
//                   child: const Icon(Icons.add_photo_alternate_outlined)),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   ),);
// }