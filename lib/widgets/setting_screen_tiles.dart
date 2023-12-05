
import 'package:flutter/material.dart';

Widget settingsScreenTiles({Color? avatarColor,IconData? icon,String? title,IconData? traingIcon,Color? avatarIconColor}){
  return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading:Container(
                  height: 100,
                  width: 60,
                  decoration:  BoxDecoration(
                    color:avatarColor,
                    shape: BoxShape.circle
                  ),
                  child:  Icon(icon,color:avatarIconColor,size: 30,),
                ),
                title:  Text(title!,style: const TextStyle(fontSize: 18),),
                trailing:  Icon(traingIcon!),
              ),
            );
}