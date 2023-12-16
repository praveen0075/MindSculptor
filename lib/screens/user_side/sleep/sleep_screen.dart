import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/screens/user_side/sleep/sleep_music_screen.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  List musics=[
    "Good Night",
    "Sleepy Night",
    "Here we go",
    "Hello world",
    "Random musics",
  ];
  List musicDuration = [
    "45 min music",
    "10 min music",
    "2 min music",
    "7 min music",
    "20 min music",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SongsDb.getSongs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      body: SizedBox(
        child: Column(
          children: [
            Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  height: 270,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset('assets/images/perfect_night.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ListTile(
                    title: Text('Bedtime',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        '"Rest is the gentlest path to renewal; sleep peacefully, wake beautifully."',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Relaxing Musics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      thickness: 6,
                      color: Color.fromARGB(255, 62, 78, 128),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(            
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: ValueListenableBuilder(
                      valueListenable: songNotifier,
                      builder: (context, musicList, child) {
                        return  GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,),
                          itemCount: musicList.length,
                          itemBuilder: ((context, index) {
                            var relaxmusic = musicList[index];
                            return Card(
                    color: Colors.white.withOpacity(0.1),
                    child: Stack(children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                               screenNavigation(context: context,screen: SleepMusicScreen(songsModel:relaxmusic,));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(13),
                                child: Container(
                                  width: double.maxFinite,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13)),
                                  child: Image.file(
                                    File(relaxmusic.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              relaxmusic.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                        
                          ],
                        ),
                      ),
                     
                    ]),
                  );
                          }));
                      },
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
// class NoScrollShade extends ScrollBehavior{
//   Widget buildViewportChrome(
//     BuildContext context,Widget child,AxisDirection axisDirection){
//       return child;
//     }
// }

// InkWell(
//                               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepMusicScreen(),));
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.all(10),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(13),
//                                       child: Container(
//                                         height: 120,
//                                         decoration: BoxDecoration(
//                                           color: Colors.blue,
//                                           borderRadius: BorderRadius.circular(13)
//                                         ),
//                                         child: Image.file(File(relaxmusic.image)),
//                                       ),
//                                     ),
//                                      Padding(
//                                       padding:  const EdgeInsets.only(left: 10),
//                                       child: Text(relaxmusic.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
//                                     ),
//                                     //  Padding(
//                                     //   padding:  const EdgeInsets.only(left: 10),
//                                     //   child: Text(musicDuration[index],style: const TextStyle(color: Colors.white),),
//                                     // )
//                                   ],
//                                 ),
//                               ),
//                             );