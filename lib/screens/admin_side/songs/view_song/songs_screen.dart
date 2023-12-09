import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/screens/admin_side/songs/add_song/new_songs_screen.dart';
import 'package:mind_sculptor/screens/admin_side/songs/add_song/new_song_screen.dart';

class AdminSongScreen extends StatefulWidget {
   const AdminSongScreen({super.key});

  @override
  State<AdminSongScreen> createState() => _AdminSongScreenState();
}

class _AdminSongScreenState extends State<AdminSongScreen> {

  @override
  void initState() {
    super.initState();
    SongsDb.getSongs();
  }
  void deleteMusic(int index){
    SongsDb.deleteSong(index);
  }

  void showDelteDialog(int index){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Delete Music'),
        content: const Text('Are you sure you want to delte this music?'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Cancel')),
          TextButton(onPressed: (){
            deleteMusic(index);
            Navigator.pop(context);
          }, child:const Text('Delete'))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewSongAdminScreen(),));
      },backgroundColor: Colors.white,child:const Icon(Icons.add,color: tc1,),),
      appBar: AppBar(
        title: const Text('Music'),
        centerTitle: true,
         backgroundColor: const Color.fromARGB(255, 18, 28, 77),
         elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: ScrollConfiguration(
            behavior:const ScrollBehavior().copyWith(overscroll: false),
            child: Column(
              children: [
                Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: songNotifier,
                      builder: (context,box,_){
                        return GridView.builder(
                          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,),
                          itemCount: box.length, 
                          itemBuilder: ((context, index) {
                            var song = box[index];
                            return Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Container(
                                      height: 120,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Image.file(File(song.image),fit: BoxFit.cover,)
                                    ),
                                  ),
                                    Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                      child: Text(song.title,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                                    ),
                                     Padding(
                                    padding: const  EdgeInsets.only(left: 7),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('6:06',style: TextStyle(color: Colors.white),),
                                         InkWell(
                                          onTap: (){
                                            showDelteDialog(index);
                                          },
                                          child: const Icon(Icons.delete_outline,color: Colors.white))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }));
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}