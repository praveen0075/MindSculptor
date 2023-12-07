import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

class EditExerciseScreen extends StatefulWidget {
  final NewExercises exercises;
  const EditExerciseScreen({super.key, required this.exercises});

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  TextEditingController stepController = TextEditingController();
  File? editedImage;
  
  void updateStep(int index, String newStep) {
    NewExercises editexercises = widget.exercises;
    editexercises.steps[index] = newStep;
  }
void updateExerciseImage(int index, File newImage) {
  setState(() {
        widget.exercises.imageSteps[index] = newImage.path;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.exercises.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
              itemCount: widget.exercises.steps.length,
              itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: TextEditingController(
                            text: widget.exercises.steps[index],
                          ),
                          onChanged: (value) {
                            updateStep(index, value);
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'step ${index + 1}'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                final picker = ImagePicker();
                                final pickedImage = await picker.pickImage(
                                    source: ImageSource.gallery);
                                        if (pickedImage != null) {
                                setState(() {
                                    updateExerciseImage(
                                        index, File(pickedImage.path));
                                });}
                              },
                              child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Image.file(
                                      File(widget.exercises.imageSteps[index]))),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
