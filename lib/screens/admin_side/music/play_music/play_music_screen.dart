import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';

class AdminPlayMusicScreen extends StatefulWidget {
  const AdminPlayMusicScreen({super.key, required this.indexOfMusic});
  final int indexOfMusic;

  @override
  State<AdminPlayMusicScreen> createState() => _AdminPlayMusicScreenState();
}

class _AdminPlayMusicScreenState extends State<AdminPlayMusicScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false; 

  @override
  void initState() {
    super.initState();
    SongsDb.getSongs();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        ),
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        body: Center(
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
                valueListenable: songNotifier,
                builder: (context, songList, child) {
                  var musicDetails = songList[widget.indexOfMusic];
                  audioPlayer.setSourceDeviceFile(musicDetails.musicPath);
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(File(musicDetails.image),
                          width: 250,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                      ),
                      sizedBox30,
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 23, horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        musicDetails.title,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Singer Name",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Slider(
                                  min: 0,
                                  max: duration.inSeconds.toDouble(),
                                  value: position.inSeconds.toDouble(),
                                  onChanged: (value)async{
                                    final position = Duration(seconds: value.toInt());
                                    await audioPlayer.seek(position);
                                  },
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white54,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "02:10",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "04:30",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                const Icon(
                                  CupertinoIcons.backward_end_fill,
                                  color: Colors.white,
                                ),
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child:  IconButton(
                                    onPressed: ()async{
                                      if(isPlaying){
                                        await audioPlayer.pause();
                                      }else{
                                        await audioPlayer.resume();
                                      }
                                    },
                                    icon:isPlaying ? const Icon(Icons.pause):const Icon(Icons.play_arrow) ,
                                  ),
                                ),
                                const Icon(
                                  CupertinoIcons.forward_end_fill,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ));
  }
}
