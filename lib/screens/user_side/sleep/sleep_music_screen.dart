import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key, required this.songsModel});
  final Songs? songsModel;
  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {
  late AudioPlayer audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    initAudioPlayer();
    SongsDb.getSongs();
  }

  Future<void> initAudioPlayer() async {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((durate) {
      setState(() {
        duration = durate;
      });
    });

    audioPlayer.onPositionChanged.listen((puss) {
      setState(() {
        position = puss;
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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    File(widget.songsModel!.image),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.songsModel!.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
                            onChanged: (value) async {
                              final position = Duration(seconds: value.toInt());
                              await audioPlayer.seek(position);
                            },
                            activeColor: Colors.white,
                            inactiveColor: Colors.white54,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                        '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
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
                            child: IconButton(
                                    onPressed: ()async{
                                      if(isPlaying){
                                        await audioPlayer.pause();
                                      }else{
                                        audioPlayer.setSourceDeviceFile(widget.songsModel!.musicPath);
                                        // audioPlayer.setSourceDeviceFile(musicDetails.musicPath);
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
            ),
          ),
        ));
  }
    @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
