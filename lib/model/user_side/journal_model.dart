import 'package:hive_flutter/hive_flutter.dart';

part 'journal_model.g.dart';

@HiveType(typeId:2)
class Journal{
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String paraghraph;

  @HiveField(3)
  String? journalKey;
  
  Journal({this.journalKey,required this.title,required this.date,required this.paraghraph});
}