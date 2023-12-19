import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/constants/constv.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: tc1.withOpacity(0.7)),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Mind Sculptor',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 4,
                    color: lg2,
                    fontFamily: GoogleFonts.irishGrover().fontFamily,
                    shadows: const [
                      Shadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 5),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'What is your current mood?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                sizedBox10,
                SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            currentMood(text: 'Happy'),
                            currentMood(text: 'Sad'),
                            currentMood(text: 'Angry'),
                            currentMood(text: 'Good'),
                            currentMood(text: 'Okay'),
                            currentMood(text: 'others'),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget currentMood({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child:  Center(
            child: Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}


       // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 45,
                            //     width: 100,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Happy',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     )),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 50,
                            //     width: 100,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Sad',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     )),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 50,
                            //     width: 100,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Angry',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     )),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 50,
                            //     width: 100,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Good',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     )),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Container(
                            //     height: 50,
                            //     width: 100,
                            //     decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15)),
                            //     ),
                            //     child: const Center(
                            //         child: Text(
                            //       'Other',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     )),
                            //   ),
                            // )
