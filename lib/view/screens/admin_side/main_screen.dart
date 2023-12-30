import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/view/screens/admin_side/daily_random_tips/daily_tips_screen.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/exercise_display/exercise_screen.dart';
import 'package:mind_sculptor/view/screens/admin_side/music/view_music/music_screen.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/authentication/logIn/log_in_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: tc1),
        backgroundColor: tc1,
        elevation: 0,
              title: Text('Admin Management',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              tc1,lg1,lg2
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const ExerciseAdmin(),));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                      ),
                      height: 70,
                      width: double.maxFinite,
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Exercise',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Icon(CupertinoIcons.right_chevron,size: 30,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminSongScreen(),));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                      ),
                      height: 70,
                      width: double.maxFinite,
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Songs',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Icon(CupertinoIcons.right_chevron,size: 30,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DailyTipsAdminScreen(),));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10)
                      ),
                      height: 70,
                      width: double.maxFinite,
                      child: const Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Daily Tips',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Icon(CupertinoIcons.right_chevron,size: 30,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: ElevatedButton(onPressed: (){
                          showDeleteDialog(context);
                        }, child: const Text('Log out')))
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
    );
  }
  void showDeleteDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to Log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
              },
              child: const Text('Log out'),
            ),
          ],
        );
      },
    );
  }
}