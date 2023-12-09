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

  static Future<bool> addSong(Songs song) async {
    final songBox = await Hive.openBox<Songs>(songBoxName);
    try {
      await songBox.add(song);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> deleteSong(int index) async {
    final songBox = await Hive.openBox<Songs>(songBoxName);
    await songBox.deleteAt(index);
    await getSongs();
  }
}