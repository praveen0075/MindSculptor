
import 'package:hive/hive.dart';

part 'music_model.g.dart';

@HiveType(typeId: 4)
class Songs{
  @HiveField(0)
   String title;
  @HiveField(1)
   String image;
  @HiveField(2)
   String musicPath;
  @HiveField(3) 
  String? musicKey;
  Songs({this.musicKey,required this.title, required this.image, required this.musicPath});
}