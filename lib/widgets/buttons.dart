import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/logIn/constv.dart';

class ButtonClass extends StatelessWidget {

  final double? width;
  final double? height;
  final double? cradius;
  final String? text;
  final VoidCallback? onpress;

 const ButtonClass({super.key,  
  this.text,
  this.height,
  this.width,
  this.onpress,
  this.cradius
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onpress,
    style: ButtonStyle(
        minimumSize: MaterialStateProperty.all( Size(width!, height!)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cradius!),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(lg1)),
    child:  Text(text!,style: const TextStyle(color: Colors.white),),
  );
  }
}


Widget normalButton({double? width,double? height,String? text,cradius,VoidCallback? onpress}) {
  return ElevatedButton(
  onPressed: onpress,
    style: ButtonStyle(
        minimumSize: MaterialStateProperty.all( Size(width!, height!)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cradius!),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.blue)),
    child:  Text(text!),
  );
}



