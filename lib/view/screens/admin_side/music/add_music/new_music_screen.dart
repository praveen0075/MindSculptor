import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/db_functions/songs/songs_db_functions.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/view/screens/admin_side/music/add_music/functions/collect_music_function.dart';
import 'package:mind_sculptor/view/widgets/snackbar.dart';

class NewSongAdminScreen extends StatefulWidget {
  const NewSongAdminScreen({super.key});

  @override
  State<NewSongAdminScreen> createState() => _NewSongAdminScreenState();
}

class _NewSongAdminScreenState extends State<NewSongAdminScreen> {
  late AudioPlayer audioPlayer;
  File? image;
  String? music;
  String? musicTitle;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration postion = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    SongsDb.getSongs();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPostion) {
      setState(() {
        postion = newPostion;
      });
    });
  }

  final TextEditingController musicTitleController = TextEditingController();
  void pickMusicImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });


  }

    Future<void> pickMusic() async {
                    String? musicPath = await collectMusic();
                    setState(() {
                      music = musicPath;
                      if (music != null) {
                        audioPlayer.setSourceDeviceFile(music!);
                        
                      }
                    });
                  }

  void saveMusicToHive() async {
    musicTitle = musicTitleController.text.trim();
    if (musicTitle == null) {
      showSnackbar(context, bgColor: Colors.red, text: 'Please add a title');
    } else if (music == null) {
      showSnackbar(context, bgColor: Colors.red, text: 'Please add a music');
    } else if (image == null) {
      showSnackbar(context, bgColor: Colors.red, text: 'Please add an image');
    } else {
      final song = Songs(
          title: musicTitle.toString(), image: image!.path, musicPath: music!);
      await SongsDb.addMusic(song);
      setState(() {
        showSnackbar(context, bgColor: Colors.green, text: 'Music is added');
        image = null;
        SongsDb.getSongs();
        music = null;
      });
      musicTitleController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Text('Add Music',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 18, 28, 77),
      body: SizedBox(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: InkWell(
                    onTap: () {
                      pickMusicImage();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    )),
              ),
              InkWell(
                onTap: () async {
                pickMusic();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Add music',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: musicTitleController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Music Title',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: postion.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final postiton = Duration(seconds: value.toInt());
                    await audioPlayer.seek(postiton);
                  }),
              CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    onPressed: () async {
                      if (music != null) {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      }
                    },
                    icon: isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                  )),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    saveMusicToHive();
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(tc1)),
                child: const Text('Save'),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
