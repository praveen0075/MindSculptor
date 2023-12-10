import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String?> collectImage()async{
  final result =await ImagePicker().pickImage(source: ImageSource.gallery);
  if(result != null){
    final pickedImagePath = File(result.path);
    return pickedImagePath.path;
  }else{
    return null;
  }
}