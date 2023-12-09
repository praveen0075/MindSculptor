import 'package:flutter/material.dart';

class ExerciseStepContainer extends StatefulWidget {
  const ExerciseStepContainer({super.key});

  @override
  State<ExerciseStepContainer> createState() => _ExerciseStepContainerState();
}

class _ExerciseStepContainerState extends State<ExerciseStepContainer> {
  TextEditingController stepTextController = TextEditingController();
  int initialheight = 100;
  bool maxline = true;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: SizedBox(
        height: 100,
        child: Padding(padding: const EdgeInsets.all(8.0),child:TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          
        )),
      ),
    );
  }
}