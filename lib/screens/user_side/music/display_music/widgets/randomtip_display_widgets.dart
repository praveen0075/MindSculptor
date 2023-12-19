import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mind_sculptor/controller/songs/songs_db_functions.dart';
import 'package:mind_sculptor/screens/admin_side/exercises/functions/exercise_screen_functions.dart';
import 'package:mind_sculptor/screens/user_side/music/play_music/sleep_music_screen.dart';

class MusicDisplayWidget extends StatefulWidget {
  const MusicDisplayWidget({super.key});

  @override
  State<MusicDisplayWidget> createState() => _MusicDisplayWidgetState();
}

class _MusicDisplayWidgetState extends State<MusicDisplayWidget> {
  @override
  void initState() {
    super.initState();
    SongsDb.getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ValueListenableBuilder(
          valueListenable: songNotifier,
          builder: (context, musicList, child) {
            if (musicList.isEmpty) {
              return const Center(
                child: Text(
                  'No Music Available!',
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  ),
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
                                  screenNavigation(
                                      context: context,
                                      screen: SleepMusicScreen(
                                        songsModel: relaxmusic,
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Container(
                                    width: double.maxFinite,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13)),
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
            }
          },
        ),
      ),
    );
  }
}
