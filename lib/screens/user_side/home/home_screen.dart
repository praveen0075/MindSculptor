
import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/home/widgets/first_container.dart';
import 'package:mind_sculptor/screens/user_side/home/widgets/randomtips_part.dart';
import 'package:mind_sculptor/screens/user_side/home/widgets/second_part_containers.dart';
import 'package:mind_sculptor/screens/user_side/home/widgets/third_part_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 FirstContainer(),
                 SecondPartContainers(),
                 JournalWriteSection(),
                 Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Row(children: [
                    Text(
                      "Today's Mindfulness Tips",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
                 RandomTipsInHomeScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/////////////////first container section////////////////



             // Center(
                //   child: Material(
                //     elevation: 8,
                //     shadowColor: Colors.grey,
                //     shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(0),
                //           bottomRight: Radius.circular(0)),
                //     ),
                //     child: ClipRRect(
                //       borderRadius: const BorderRadius.only(
                //           bottomLeft: Radius.circular(0),
                //           bottomRight: Radius.circular(0)),
                //       child: Container(
                //         height: 200,
                //         width: double.infinity,
                //         decoration: BoxDecoration(color: tc1.withOpacity(0.7)),
                //         child: Column(
                //           children: [
                //             const SizedBox(
                //               height: 40,
                //             ),
                //             Text(
                //               'Mind Sculptor',
                //               style: TextStyle(
                //                 fontSize: 20,
                //                 letterSpacing: 4,
                //                 color: lg2,
                //                 fontFamily:
                //                     GoogleFonts.irishGrover().fontFamily,
                //                 shadows: const [
                //                   Shadow(
                //                       color: Colors.grey,
                //                       offset: Offset(2, 2),
                //                       blurRadius: 5),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(
                //               height: 20,
                //             ),
                //             const Row(
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsets.only(left: 20),
                //                   child: Text(
                //                     'What is your current mood?',
                //                     style: TextStyle(
                //                         fontSize: 16,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                 )
                //               ],
                //             ),
                //             sizedBox10,
                //             SizedBox(
                //                 width: double.infinity,
                //                 height: 80,
                //                 child: Center(
                //                   child: SingleChildScrollView(
                //                     scrollDirection: Axis.horizontal,
                //                     child: Row(
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                             height: 45,
                //                             width: 100,
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(15)),
                //                             ),
                //                             child: const Center(
                //                                 child: Text(
                //                               'Happy',
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )),
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                             height: 50,
                //                             width: 100,
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(15)),
                //                             ),
                //                             child: const Center(
                //                                 child: Text(
                //                               'Sad',
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )),
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                             height: 50,
                //                             width: 100,
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(15)),
                //                             ),
                //                             child: const Center(
                //                                 child: Text(
                //                               'Angry',
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )),
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                             height: 50,
                //                             width: 100,
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(15)),
                //                             ),
                //                             child: const Center(
                //                                 child: Text(
                //                               'Good',
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )),
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Container(
                //                             height: 50,
                //                             width: 100,
                //                             decoration: const BoxDecoration(
                //                               color: Colors.white,
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(15)),
                //                             ),
                //                             child: const Center(
                //                                 child: Text(
                //                               'Other',
                //                               style: TextStyle(
                //                                   fontWeight: FontWeight.bold),
                //                             )),
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                 ))
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),






            // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Container(
                //         height: 200,
                //         width: 180,
                //         decoration: BoxDecoration(
                //             color:const Color.fromARGB(255, 19, 109, 253)
                //                 .withOpacity(0.7),
                //             borderRadius: BorderRadius.circular(20)),
                //         child: const Stack(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Yoga',
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 18),
                //                   ),
                //                   Text('Exercises')
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         height: 200,
                //         width: 180,
                //         decoration: BoxDecoration(
                //             color: Colors.amber.withOpacity(0.7),
                //             borderRadius: BorderRadius.circular(20)),
                //         child: const Stack(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.all(8.0),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Sleep Night',
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 18),
                //                   ),
                //                   Text('Music')
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),


                           // Card(
                //   elevation: 5,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Container(
                //     width: 390,
                //     height: 65,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(15),
                //         border: Border.all(
                //             color: Colors.black,
                //             strokeAlign: BorderSide.strokeAlignCenter)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         const Text(
                //           'Write Your Mindfulness Thoughts',
                //           style: TextStyle(
                //               fontSize: 17, fontWeight: FontWeight.bold),
                //         ),
                //         InkWell(
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         const JournalWriteScreen(),
                //                   ));
                //             },
                //             child: const Icon(CupertinoIcons.right_chevron))
                //       ],
                //     ),
                //   ),
                // ),



                   //  Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: SizedBox(
              //             height: 150,
              //             width: double.maxFinite,
              //             child: Card(
              //               elevation: 5,
              //               color: const Color.fromARGB(255, 13, 119, 195)
              //                   .withOpacity(0.7),
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(20)),
              //               child:  Padding(
              //                 padding:  const EdgeInsets.all(10.0),
              //                 child: Center(
              //                   child: Padding(
              //                     padding:  const EdgeInsets.all(8.0),
              //                     child: Text(tipvariable1??"Be present in this moment; it's the only one that truly exists.",
              //                       // randomTips[0],
              //                       // randomTips.isNotEmpty ? randomTips[0]: 'akjsddkfhkahsdfkhkalshdfkhsadklh',
              //                       style:  const TextStyle(
              //                           color: Colors.white, fontSize: 17),
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: SizedBox(
              //       height: 150,
              //       width: double.maxFinite,
              //       child: Card(
              //         elevation: 5,
              //         color: const Color.fromARGB(255, 47, 152, 114)
              //             .withOpacity(0.7),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20)),
              //         child:  Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Center(
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Text(
              //                 tipvariable2??"Train your mind to see the good in every situation.",
              //                 // randomTips.isNotEmpty ? randomTips[1]:'jkahdfkkahfiawueopuaihfdhadfhdkfkahkfhla',
              //                 style:
              //                     const TextStyle(color: Colors.white, fontSize: 17),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ), Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: SizedBox(
              //       height: 150,
              //       width: double.maxFinite,
              //       child: Card(
              //         elevation: 5,
              //         color: const Color.fromARGB(255, 211, 137, 84)
              //             .withOpacity(0.7),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20)),
              //         child:  Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Center(
              //             child: Padding(
              //               padding:const EdgeInsets.all(8.0),
              //               child: Text(
              //               tipvariable3??"Peace begins with a mindful breath.",
              //                 // randomTips.isNotEmpty? randomTips[3]:'aksdhfkhashfdklhaskdlfhklahsdfklhasldfhlahsdfhalkhsdflhadfhlj',
              //                 style:
              //                    const TextStyle(color: Colors.white, fontSize: 17),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),

              //       ],
                
              //   ),