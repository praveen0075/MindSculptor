import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mind_sculptor/model/user_side/journal_model.dart';

ValueNotifier<List<Journal>> journalNotifier = ValueNotifier([]);

class JournalDB with ChangeNotifier{
  static String journalDb = "journal_dbname";

  static Future<void> addJournal(Journal newJournal)async {
    final addjournalBox = await Hive.openBox<Journal>(journalDb);
    final timeKey = DateTime.now().millisecondsSinceEpoch.toString(); 
    newJournal.journalKey = timeKey;
    await addjournalBox.put(timeKey, newJournal);
  }

  static Future <List<Journal>> getjournal()async{
    final getjournalBox = await Hive.openBox<Journal>(journalDb);
     journalNotifier.value.clear();
     List<Journal> journals = getjournalBox.values.toList();
     journalNotifier.value = journals;
    //  journalNotifier.value = getjournalBox.values.toList();
     journalNotifier.notifyListeners();
     return journals;
  }

  static Future<void> updateJournal(Journal updatedJournal)async{
    final updateJournalBox = await Hive.openBox<Journal>(journalDb);
    String key = updatedJournal.journalKey??" ";
    updateJournalBox.put(key, updatedJournal);  
    await getjournal();
  }

  static Future <void> deleteJournal(String key)async{
    final deleteJournalbox = await Hive.openBox<Journal>(journalDb);
    await deleteJournalbox.delete(key);
    await getjournal();
  }
}