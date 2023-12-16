
import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<String>  collectMusic() async{
    try {
       final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      // allowMultiple: false,
     );
     if(result != null){
      final musicFile =  File(result.files.single.path!);
      return musicFile.path;
     }
     return "path didn't get";
    }on Exception catch (e) {
      print("the error is here $e");
      return "the error$e";
    } catch(e){
     print("the catched error is $e");
     return "the error$e";
    }
    }  

//     Future<String?> collectImage()async{
//   final result =await ImagePicker().pickImage(source: ImageSource.gallery);
//   if(result != null){
//     final pickedImagePath = File(result.path);
//     return pickedImagePath.path;
//   }else{
//     return null;
//   }
// }