import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_sculptor/screens/user_side/journal/journal_write_screen.dart';

class JournalWriteSection extends StatelessWidget {
  const JournalWriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 390,
        height: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Colors.black,
                strokeAlign: BorderSide.strokeAlignCenter)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Write Your Mindfulness Thoughts',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JournalWriteScreen(),
                      ));
                },
                child: const Icon(CupertinoIcons.right_chevron))
          ],
        ),
      ),
    );
  }
}
