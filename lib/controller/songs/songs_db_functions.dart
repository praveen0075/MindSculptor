import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mind_sculptor/model/admin_side/music_model.dart';

ValueNotifier<List<Songs>> songNotifier = ValueNotifier([]);

class SongsDb with ChangeNotifier {
  static const String songBoxName = 'songs';

  static Future<void> getSongs() async {
    final songBox = await Hive.openBox<Songs>(songBoxName);
    songNotifier.value.clear();
    songNotifier.value = songBox.values.toList();
    songNotifier.notifyListeners();
  }

  static Future <void> addMusic(Songs song)async{
    final musicBox = await Hive.openBox<Songs>(songBoxName);
    final timekey = DateTime.now().millisecondsSinceEpoch.toString();
    song.musicKey = timekey;
    await musicBox.put(timekey, song);
    // print('the key is added or music is added to databse $timekey');
  }

  static Future <void> updatMusic(Songs editedMusic)async{
    final updatedMusicBox = await Hive.openBox<Songs>(songBoxName);
    String key = editedMusic.musicKey??'';
    updatedMusicBox.put(key, editedMusic);
    getSongs();  
  }

  static Future<void> deleteSong(int index) async {
    final songBox = await Hive.openBox<Songs>(songBoxName);
    await songBox.deleteAt(index);
    await getSongs();
  }
}