import 'package:flutter/material.dart';
import 'package:mind_sculptor/model/user_side/user_model.dart';

class ProfileTextfields {
  // static String? userKey;
  // static User? userModeToStor;
  // static String uusername = userModeToStor!=null?userModeToStor!.username:'';
  static Widget profilleTextField({ User? userModel}) {
    return Column(
      children: [
        SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text:userModel?.username),
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Username',
              ),
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: 'df'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Your Name',
              ),
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: ''),
              decoration:const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'Email-id',
              ),
            ),
          ),
        ),
         SizedBox(
          child: Card(
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side:  BorderSide(style: BorderStyle.solid, width: 2)),
            elevation: 10,
            child: TextField(
              controller: TextEditingController(text: 'sfhh'),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: 'shf',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
