
import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<String>  collectMusic() async{
    try {
       final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
     );
     if(result != null){
      final musicFile =  File(result.files.single.path!);
      return musicFile.path;
     }
     return "path didn't get";
    }on Exception catch (e) {
      return "the error$e";
    } catch(e){
     return "the error$e";
    }
    }  
