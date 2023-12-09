
import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future collectMusic() async{
     final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
     );
     if(result != null){
      final musicFile =  File(result.files.single.path!);
      return musicFile.path;
     }
     return null;
    }