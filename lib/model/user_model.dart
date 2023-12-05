
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User{
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String  email;
  @HiveField(2)
  final String password;

  User({required this.username, required this.email, required this.password});

}