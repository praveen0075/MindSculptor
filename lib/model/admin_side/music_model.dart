
import 'package:hive/hive.dart';

part 'music_model.g.dart';

@HiveType(typeId: 4)
class Songs{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String musicPath;

  Songs({required this.title, required this.image, required this.musicPath});
}