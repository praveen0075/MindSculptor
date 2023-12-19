// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:mind_sculptor/controller/constants/constv.dart';
// import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

// class EditExerciseCard extends StatefulWidget {
//    EditExerciseCard({super.key, required this.exercises, required this.pickCardImage, required this.editedImage,  this.editedTitle, this.editedDescription});
//   final NewExercises exercises;
//    Future<void> Function() pickCardImage;
//   final String? editedImage;
//   String? editedTitle;
//   String? editedDescription;

//   @override
//   State<EditExerciseCard> createState() => _EditExerciseCardState();
// }

// class _EditExerciseCardState extends State<EditExerciseCard> {
//   @override
//   Widget build(BuildContext context) {
//     return   Padding(
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
//                           InkWell(
//                             onTap: () {
//                               widget.pickCardImage;
//                             },
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(15),
//                               child: Container(
//                                   height: 70,
//                                   width: 70,
//                                   decoration: BoxDecoration(
//                                     image: widget.editedImage == null
//                                         ? DecorationImage(
//                                             image: FileImage(
//                                                 File(widget.exercises.cardImage)),
//                                             fit: BoxFit.cover)
//                                         : DecorationImage(
//                                             image: FileImage(File(widget.editedImage!)),
//                                             fit: BoxFit.cover),
//                                     color: Colors.grey,
//                                   ),
//                                   child: const Icon(Icons.image)),
//                             ),
//                           ),
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
//                                     decoration: const InputDecoration.collapsed(
//                                         hintText: 'Title'),
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 17),
//                                     onChanged: (newValue) {
//                                       widget.editedTitle = newValue;
//                                     },
//                                   ),
//                                 ),
//                                 sizedBox10,
//                                 SizedBox(
//                                   width: 250,
//                                   child: TextField(
//                                     keyboardType: TextInputType.multiline,
//                                     maxLines: 3,
//                                     textAlign: TextAlign.left,
//                                     controller: TextEditingController(
//                                         text: widget.exercises.description),
//                                     decoration: const InputDecoration.collapsed(
//                                         hintText: 'Description'),
//                                     style: const TextStyle(fontSize: 15),
//                                     onChanged: (newValue) {
//                                       widget.editedDescription = newValue;
//                                     },
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
//     );
//   }
// }