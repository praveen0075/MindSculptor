import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/songs/songs_db_functions.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';

class PlayMusicSection extends StatefulWidget {
  const PlayMusicSection({super.key, this.songsModel});
  final Songs? songsModel;

  @override
  State<PlayMusicSection> createState() => _PlayMusicSectionState();
}

class _PlayMusicSectionState extends State<PlayMusicSection> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
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
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          sizedBox30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              sizedBox20w,
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      audioPlayer
                          .seek(Duration(seconds: position.inSeconds - 10));
                      setState(() {});
                    },
                  ),
                  const Text(
                    '10 sec',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      audioPlayer
                          .setSourceDeviceFile(widget.songsModel!.musicPath);
                      // audioPlayer.setSourceDeviceFile(musicDetails.musicPath);
                      await audioPlayer.resume();
                    }
                  },
                  icon: isPlaying
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      audioPlayer
                          .seek(Duration(seconds: position.inSeconds + 10));
                      setState(() {});
                    },
                  ),
                  const Text(
                    '10 sec',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
     @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }
}
