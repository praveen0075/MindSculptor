import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/screens/admin_side/music/add_music/new_music_screen.dart';
import 'package:mind_sculptor/screens/admin_side/music/play_music/play_music_screen.dart';

class AdminSongScreen extends StatefulWidget {
  const AdminSongScreen({super.key});

  @override
  State<AdminSongScreen> createState() => _AdminSongScreenState();
}

class _AdminSongScreenState extends State<AdminSongScreen> {
  @override
  void initState(){
    super.initState();
    SongsDb.getSongs();
  }

  void deleteMusic(int index){
    SongsDb.deleteSong(index);
  }

  void showDelteDialog(int index){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Music'),
            content: const Text('Are you sure you want to delte this music?'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: (){
                    deleteMusic(index);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewSongAdminScreen(),
              ));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: tc1,
        ),
      ),
      appBar: AppBar(
        title: const Text('Music'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        // backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      // backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: songNotifier,
          builder: (context, songList, child){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                ),
                itemCount: songList.length,
                itemBuilder: ((context, indexno) {
                  var relaxmusic = songList[indexno];
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
                                screenNavigation(
                                  context: context,
                                  screen: AdminPlayMusicScreen(relaxmusic: relaxmusic, indexOfMusic: indexno,
                                  ),
                                );
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
                      Positioned(
                        bottom: 10,
                        right: 12,
                        child: InkWell(
                            onTap: () => showDelteDialog(indexno),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white, 
                            )),
                      ),
                    ]),
                  );
                }));
          },
        ),
      ),
    );
  }
}


// ListView.separated(
//                   separatorBuilder: (context, index) => sizedBox10,
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: songList.length,
//                   itemBuilder: (context, index){
//                     var relaxmusic = songList[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: (){
//                           // showDialogueForEditMusic(context);
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminPlayMusicScreen(),));
//                         },
//                         child: Container(
//                           height: 80,
//                           decoration: BoxDecoration(
//                             color: Colors.white38.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(10)
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 child: Image.file(File(relaxmusic.image),height: 50,width: 50,fit: BoxFit.cover,),
//                               ),
//                               sizedBox20w,
//                                Expanded(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(relaxmusic.title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight: FontWeight.bold),),
//                                   ],
//                                 ),
//                               ),
//                                Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () => showDelteDialog(index) ,
//                                     child: const Icon(Icons.delete_outline,color: Colors.white,)),
//                                   // Icon(Icons.edit_outlined,color: Colors.white,)
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                 },);



   // child: Column(
            //   children: [
            //     Expanded(
            //         child: ValueListenableBuilder(
            //           valueListenable: songNotifier,
            //           builder: (context,box,_){
            //             return GridView.builder(
            //               gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 2,
            //                   crossAxisSpacing: 8,),
            //               itemCount: box.length, 
            //               itemBuilder: ((context, index) {
            //                 var song = box[index];
            //                 return Container(
            //                   width: double.maxFinite,
            //                   margin: const EdgeInsets.all(10),
            //                   child: Column(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       ClipRRect(
            //                         borderRadius: BorderRadius.circular(13),
            //                         child: Container(
            //                           height: 120,
            //                           width: double.maxFinite,
            //                           decoration: BoxDecoration(
            //                             color: Colors.blue,
            //                             borderRadius: BorderRadius.circular(13),
            //                           ),
            //                           child: Image.file(File(song.image),fit: BoxFit.cover,)
            //                         ),
            //                       ),
            //                         Padding(
            //                         padding: const EdgeInsets.only(left: 7),
            //                           child: Text(song.title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
            //                         ),
            //                          Padding(
            //                         padding: const  EdgeInsets.only(left: 7),
            //                         child: Row(
            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             const Text('6:06',style: TextStyle(color: Colors.white),),
            //                              InkWell(
            //                               onTap: (){
            //                                 showDelteDialog(index);
            //                               },
            //                               child: const Icon(Icons.delete_outline,color: Colors.white))
            //                           ],
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 );
            //               }));
            //           },
            //         ),
            //       ),
            //   ],
            // ),