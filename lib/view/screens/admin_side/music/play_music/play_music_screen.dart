
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/controller/db_functions/songs/songs_db_functions.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/view/screens/admin_side/exercises/functions/imagepicker_function.dart';
import 'package:mind_sculptor/view/screens/admin_side/music/add_music/functions/collect_music_function.dart';
import 'package:mind_sculptor/view/widgets/snackbar.dart';

class AdminPlayMusicScreen extends StatefulWidget {
  const AdminPlayMusicScreen({super.key, required this.indexOfMusic, required  this.relaxmusic,});  
  final int indexOfMusic;
  final Songs relaxmusic;
  @override
  State<AdminPlayMusicScreen> createState() => _AdminPlayMusicScreenState();
}

class _AdminPlayMusicScreenState extends State<AdminPlayMusicScreen> {
  String? editedMusicTitle;
  String? editedImage;
  String? editedMusic;
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


  void updateMusicDetailsToHive(){
    var musicModel = Songs(image: editedImage??widget.relaxmusic.image,musicPath: editedMusic??widget.relaxmusic.musicPath,title: editedMusicTitle??widget.relaxmusic.title,musicKey: widget.relaxmusic.musicKey);
    SongsDb.updatMusic(musicModel);
    showSnackbar(context,bgColor: Colors.green,text: 'Music Updated Successfully');
  }

  Future<void> initAudioPlayer()async{
     audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((durate){
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

    void pickMusicImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        editedImage = File(pickedImage.path).path;
      }
    });
  }
  
Future <void> pickMusic()async{
  String musicpath = await collectMusic();
  setState(() {
    editedMusic = musicpath;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                title: Text('Music',style: TextStyle(fontFamily: GoogleFonts.archivoBlack().fontFamily)),
        centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              updateMusicDetailsToHive();
            }, icon: const Icon(Icons.done))
          ],
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
                  return Column(
                    children: [
                      sizedBox10,
                      InkWell(
                        onTap: ()async{
                          final imagepath = await collectImage();
                          setState((){
                              if(imagepath != null){
                              editedImage = imagepath;
                            }
                          });
                        },
                        child: SizedBox(
                             width: 250,
                              height: 260,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: editedImage != null ? Image.file(File(editedImage!)):Image.file(File(musicDetails.image),
                            // child: Image.file(File(musicDetails.image)
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      sizedBox40,
                      sizedBox10,
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Column(
                          children: [
                            sizedBox30,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 23, horizontal: 20),
                              child: TextField(
                               decoration: const InputDecoration.collapsed(hintText: 'music title'),
                               controller: TextEditingController(text: musicDetails.title),
                               style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                        onChanged: (newValue){
                                          editedMusicTitle = newValue;  
                                        },
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
                                Column(
                                   children: [
                                     IconButton(
                                     icon: const Icon(Icons.arrow_back_ios_new_sharp,size: 35,color: Colors.white,),
                                     onPressed: () {
                                       audioPlayer.seek(Duration(seconds: position.inSeconds - 10));
                                       setState(() {
                                         
                                       });
                                     },
                                ),
                                const Text('10 sec',style: TextStyle(color: Colors.white),)
                                   ],
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
                                        audioPlayer.setSourceDeviceFile(editedMusic ?? musicDetails.musicPath);
                                        // audioPlayer.setSourceDeviceFile(musicDetails.musicPath);
                                        await audioPlayer.resume();
                                      }
                                    },
                                    icon:isPlaying ? const Icon(Icons.pause):const Icon(Icons.play_arrow) ,
                                  ),
                                ),
                                 Column(
                                   children: [
                                     IconButton(
                                     icon: const Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.white,),
                                     onPressed: () {
                                       audioPlayer.seek(Duration(seconds: position.inSeconds + 10));
                                       setState(() {
                                         
                                       });
                                     },
                                ),
                                const Text('10 sec',style: TextStyle(color: Colors.white),)
                                   ],
                                 ),
                                const SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                            sizedBox30,
                             ElevatedButton(
                              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                              onPressed: ()async{
                               pickMusic();
                             }, child: const Text('Change music?')),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ));
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}

