import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';
import 'package:mind_sculptor/view/screens/user_side/home/widgets/mood_container.dart';
// import 'package:mind_sculptor/view/screens/user_side/home/widgets/mood_container.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({super.key});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  String? username;
  String? key = " ";
   User? currentUser;
  @override
  void initState(){
    super.initState();
    getusername();
  }
  getusername()async{
    key = await UserDb.getSavedKey();
    if(key != null && key!.isNotEmpty){
      final user = await UserDb.getUserById(key!);
      setState(() {
         username = user!.username;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/firstcontainerimage.jpg"),
                  fit: BoxFit.cover,
                ),
                color: tc1.withOpacity(0.7)),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 25,
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
                        'Hello..',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    // Padding(
                    //   padding:const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     username??"User...",
                    //     style: const TextStyle(color: Colors.white, fontSize: 19),
                    //   ),
                    // )
                  ],
                ),
                sizedBox10,
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(children: [
                    Text(
                      "What is your current mood?",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: MoodContainers(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


 //
                    // child: Center(
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         currentMood(text: 'Happy'),
                    //         currentMood(text: 'Sad'),
                    //         currentMood(text: 'Angry'),
                    //         currentMood(text: 'Good'),
                    //         currentMood(text: 'Okay'),
                    //         currentMood(text: 'others'),
                    //       ],
                    //     ),
                    //   ),
                    // ),

//   Widget currentMood({String? text}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 45,
//         width: 100,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(15)),
//         ),
//         child:  Center(
//             child: Text(
//           text!,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         )),
//       ),
//     );
//   }
// }


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



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mind_sculptor/controller/constants/constv.dart';

// class FirstContainer extends StatelessWidget {
//   const FirstContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Material(
//         elevation: 8,
//         shadowColor: Colors.grey,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
//           child: Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(color: tc1.withOpacity(0.7)),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Text(
//                   'Mind Sculptor',
//                   style: TextStyle(
//                     fontSize: 20,
//                     letterSpacing: 4,
//                     color: lg2,
//                     fontFamily: GoogleFonts.irishGrover().fontFamily,
//                     shadows: const [
//                       Shadow(
//                           color: Colors.grey,
//                           offset: Offset(2, 2),
//                           blurRadius: 5),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 20),
//                       child: Text(
//                         'What is your current mood?',
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//                 sizedBox10,
//                 SizedBox(
//                     width: double.infinity,
//                     height: 80,
//                     child: Center(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             currentMood(text: 'Happy'),
//                             currentMood(text: 'Sad'),
//                             currentMood(text: 'Angry'),
//                             currentMood(text: 'Good'),
//                             currentMood(text: 'Okay'),
//                             currentMood(text: 'others'),
//                           ],
//                         ),
//                       ),
//                     ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget currentMood({String? text}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 45,
//         width: 100,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(15)),
//         ),
//         child:  Center(
//             child: Text(
//           text!,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         )),
//       ),
//     );
//   }
// }