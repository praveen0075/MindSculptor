import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/screens/user_side/music/play_music/widgets/play_music.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key, required this.songsModel});
  final Songs? songsModel;
  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen> {
  @override
  void initState() {
    super.initState();
    SongsDb.getSongs();
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
                sizedBox10,
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
                sizedBox20,
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Column(
                    children: [
                      sizedBox40,
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
                                sizedBox10,
                              ],
                            )
                          ],
                        ),
                      ),
                      PlayMusicSection(
                        songsModel: widget.songsModel,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}




   // audioPlayer = AudioPlayer();
    // initAudioPlayer();


  // late AudioPlayer audioPlayer;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  // bool isPlaying = false;

  // Future<void> initAudioPlayer() async {
  //   audioPlayer.onPlayerStateChanged.listen((state) {
  //     setState(() {
  //       isPlaying = state == PlayerState.playing;
  //     });
  //   });

  //   audioPlayer.onDurationChanged.listen((durate) {
  //     setState(() {
  //       duration = durate;
  //     });
  //   });

  //   audioPlayer.onPositionChanged.listen((puss) {
  //     setState(() {
  //       position = puss;
  //     });
  //   });
  // }

    //   SingleChildScrollView(
                    //     child: Column(
                    //       children: [
                    //         Column(
                    //           children: [
                    //             Slider(
                    //               min: 0,
                    //               max: duration.inSeconds.toDouble(),
                    //               value: position.inSeconds.toDouble(),
                    //               onChanged: (value) async {
                    //                 final position = Duration(seconds: value.toInt());
                    //                 await audioPlayer.seek(position);
                    //               },
                    //               activeColor: Colors.white,
                    //               inactiveColor: Colors.white54,
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.symmetric(horizontal: 25),
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                    Text(
                    //                           '${position.inMinutes}:${position.inSeconds.remainder(60)}',
                    //                           style: TextStyle(
                    //                               color:
                    //                                   Colors.white.withOpacity(0.6),
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 16),
                    //                         ),
                    //                         Text(
                    //                           '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                    //                           style: TextStyle(
                    //                               color:
                    //                                   Colors.white.withOpacity(0.6),
                    //                               fontWeight: FontWeight.w500,
                    //                               fontSize: 16),
                    //                         )
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //          sizedBox30,
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //  sizedBox30,
                    //      Column(
                    //                children: [
                    //                  IconButton(
                    //                  icon: const Icon(Icons.arrow_back_ios_new_sharp,size: 35,color: Colors.white,),
                    //                  onPressed: () {
                    //                    audioPlayer.seek(Duration(seconds: position.inSeconds - 10));
                    //                    setState(() {
                                         
                    //                    });
                    //                  },
                    //             ),
                    //             const Text('10 sec',style: TextStyle(color: Colors.white),)
                    //                ],
                    //              ),
                    //       Container(
                    //         height: 55,
                    //         width: 55,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //         child: IconButton(
                    //                 onPressed: ()async{
                    //                   if(isPlaying){
                    //                     await audioPlayer.pause();
                    //                   }else{
                    //                     audioPlayer.setSourceDeviceFile(widget.songsModel!.musicPath);
                    //                     // audioPlayer.setSourceDeviceFile(musicDetails.musicPath);
                    //                     await audioPlayer.resume();
                    //                   }
                    //                 },
                    //                 icon:isPlaying ? const Icon(Icons.pause):const Icon(Icons.play_arrow) ,
                    //               ),
                    //       ),
                    //       Column(
                    //                children: [
                    //                  IconButton(
                    //                  icon: const Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.white,),
                    //                  onPressed: () {
                    //                    audioPlayer.seek(Duration(seconds: position.inSeconds + 10));
                    //                    setState(() {
                                         
                    //                    });
                    //                  },
                    //             ),
                    //             const Text('10 sec',style: TextStyle(color: Colors.white),)
                    //                ],
                    //              ),
                    //       const SizedBox(
                    //         width: 30,
                    //       ),
                    //     ],
                    //   )
                    //       ],
                    //     ),
                    //   ),
                     
