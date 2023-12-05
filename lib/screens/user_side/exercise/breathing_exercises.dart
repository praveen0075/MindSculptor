import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/logIn/constv.dart';

class BreathingExerciseScreen extends StatelessWidget {
   BreathingExerciseScreen({super.key});

   final List<Map<String, String>> exercises = [
    {
      'title': 'Exercise 1',
      'description': 'Find a comfortable position, either sitting or standing. Relax your shoulders and neck muscles.:',
      'description1': 'Find a comfortable position, either sitting or standing. Relax your shoulders and neck muscles.:',
      'description3': 'Find a comfortable position, either sitting or standing. Relax your shoulders and neck muscles.:',
    },
    {
      'title': 'Exercise 2',
      'description': 'Description for Exercise 2...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: tc1,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            tc1,
            lg1,
            lg2,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: 750,
                    width: double.infinity,
                    child: Column(
                      children: [
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          exercises[index]['title'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                exercises[index]['description'] ?? '',
                                style: const TextStyle(fontSize: 14),
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
        ));
  }
}
