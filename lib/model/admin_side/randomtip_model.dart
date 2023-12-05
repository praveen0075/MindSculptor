import 'package:hive_flutter/hive_flutter.dart';

part 'randomtip_model.g.dart';

@HiveType(typeId: 1)
class RandomTips{
  @HiveField(0)
  List <String> tip;
  RandomTips(this.tip);
}