import 'package:flutter/material.dart';

class ButtonClass extends StatelessWidget {

  final double? width;
  final double? height;
  final double? cradius;
  final String? text;
  final VoidCallback? onpress;
  final MaterialStateProperty<Color?>? bgColor;

 const ButtonClass({super.key,  
  this.text,
  this.height,
  this.width,
  this.onpress,
  this.cradius, this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: onpress,
    style: ButtonStyle(
      backgroundColor: bgColor,
        minimumSize: MaterialStateProperty.all( Size(width!, height!)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cradius!),
          ),
        ),
       ),
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



