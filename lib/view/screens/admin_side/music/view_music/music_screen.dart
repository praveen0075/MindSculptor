import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/songs/songs_db_functions.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/view/screens/admin_side/music/add_music/new_music_screen.dart';
import 'package:mind_sculptor/view/screens/admin_side/music/play_music/play_music_screen.dart';

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
            title: Text('Music',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: songNotifier,
          builder: (context, songList, child){
            if(songList.isEmpty){
              return const Center(child: Text('No music available!',style: TextStyle(color: Colors.white),));
            }else{
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
                }));}
          },
        ),
      ),
    );
  }
}

