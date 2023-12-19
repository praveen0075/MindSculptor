import 'package:flutter/material.dart';

class RandomTipsInHomeScreen extends StatelessWidget {
  const RandomTipsInHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 150,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(255, 13, 119, 195).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding:  EdgeInsets.all(10.0),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style:  TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 150,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(255, 47, 152, 114).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding:  EdgeInsets.all(10.0),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style:  TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 150,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              color: const Color.fromARGB(255, 211, 137, 84).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding:  EdgeInsets.all(10.0),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style:  TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
