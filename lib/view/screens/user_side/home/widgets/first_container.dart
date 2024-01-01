import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
// import 'package:mind_sculptor/controller/db_functions/user/authentication_db_functions.dart';
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

