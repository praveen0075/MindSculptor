import 'package:flutter/material.dart';

 screenNavigation({context, screen}) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  screen,
      ));
}
//deleteDialoguebox functon //
   void showDeleteDialog(int index,context, void Function() onpressFunction,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Exercise'),
          content: const Text('Are you sure you want to delete this exercise?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onpressFunction();
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }