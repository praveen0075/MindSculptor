import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/model/admin_side/exercise_model.dart';

class TempListDisplayWidget extends StatefulWidget {
  const TempListDisplayWidget({super.key, required this.tempList});
  final List<StepsOfExerciseModel> tempList;

  @override
  State<TempListDisplayWidget> createState() => _TempListDisplayWidgetState();
}

class _TempListDisplayWidgetState extends State<TempListDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: widget.tempList.isEmpty
          ? const Center(
              child: Text(
              'No instructions added',
              style: TextStyle(color: Colors.white),
            ))
          : SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: TextEditingController(
                                    text: widget.tempList[index].stepText),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                style: const TextStyle(color: Colors.white),
                                onChanged: (changedValue) {
                                  editinstruction(index, changedValue);
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
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
                                            image: FileImage(File(widget
                                                .tempList[index].imageOfStep!)),
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
                                            child: const Icon(
                                                Icons.edit_outlined)),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => sizedBox10,
                  itemCount: widget.tempList.length)),
    );
  }

  void editinstruction(int index, String instruction) {
    widget.tempList[index].stepText = instruction;
  }

  void editStepsImage(int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        widget.tempList[index].imageOfStep = File(pickedImage.path).path;
      });
    }
  }
}
