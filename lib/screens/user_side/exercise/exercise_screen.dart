import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/exercise/breathing_exercises.dart';
import 'package:mind_sculptor/screens/user_side/logIn/constv.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [tc1, lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BreathingExerciseScreen(),
                        )),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.network(
                                "https://getpaidstock.com/tmp/[GetPaidStock.com]-655dd4614f9b2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Breathin Exercises',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Discover the power of deep breathing with our simple exercises designed to calm the mind and relax the body.',
                                    textAlign: TextAlign.center,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
 