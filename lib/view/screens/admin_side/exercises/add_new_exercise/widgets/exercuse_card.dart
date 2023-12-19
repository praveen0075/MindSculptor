import 'dart:io';

import 'package:flutter/material.dart';

Widget exerciseCard(
    {TextEditingController? titleTextController,
    TextEditingController? descriptionController,
    String? selectedImage,
    Future<void> Function()? pickImage}) {
  return Padding(
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                            image: FileImage(File(selectedImage)),
                            fit: BoxFit.cover,
                          )
                        : null,
                    color: Colors.grey,
                  ),
                  child: InkWell(
                      onTap: () {
                        pickImage!();
                      },
                      child: const Icon(Icons.add_photo_alternate_outlined)),
                ),
                Flexible(
                  child: SingleChildScrollView(
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
                            keyboardType: TextInputType.multiline,
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
  );
}
