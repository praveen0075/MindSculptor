import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_sculptor/widgets/snackbar.dart';

class NewSongAdminScreen extends StatefulWidget {
    const NewSongAdminScreen({super.key});

    @override
    State<NewSongAdminScreen> createState() => _NewSongAdminScreenState();
  }
  class _NewSongAdminScreenState extends State<NewSongAdminScreen> {
  File? image;
  String? music;
  String? musicTitle;

  late Box<Songs> songBox;

  @override
  void initState() {
    super.initState();
    songBox = Hive.box('songs');
  }

  final TextEditingController musicTitleController = TextEditingController();
    void pickMusicImage()async{
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
          if(pickedImage != null){
          image = File(pickedImage.path);
      }
      });
    }

    void collectMusic() async{
     FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
     );
     if(result != null){
      setState(() {
        music = result.files.single.path!;
      });
     }
    }

    void saveMusicToHive()async{
      musicTitle = musicTitleController.text.trim();
      if(musicTitle == null){
        showSnackbar(context,bgColor: Colors.red,text: 'please Add a title');
      }else if( music == null){
        showSnackbar(context,bgColor: Colors.red,text: 'please Add a music');
      }else if (image == null){
        showSnackbar(context,bgColor: Colors.red,text: 'please Add an image');
      }else{
        final songs = Songs(title: musicTitle.toString(), image: image!.path, musicPath:music!);
        await songBox.add(songs);
        setState(() {
         showSnackbar(context,bgColor: Colors.green,text: 'Music is added');
          image = null;
        }); 
        musicTitleController.clear();
      }
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 28, 77),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 18, 28, 77),
        body: SizedBox(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 200,
                width: 200,
                decoration:  BoxDecoration(
                  image: image != null  
                      ? DecorationImage(
                          image: FileImage(image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: Colors.white,
                  borderRadius:  const BorderRadius.all(Radius.circular(10)),
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
                onTap: () {
                 collectMusic();
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
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const  EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: musicTitleController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Music Title',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
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
    );
  }
}
