import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/widgets/bottomnavigaiton/bottomnavigation_bar.dart';
import 'package:mind_sculptor/widgets/buttons.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [lg1, lg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Mind Sculptor',
                    style: TextStyle(
                      fontSize: 30,
                      color: lg2,
                      fontFamily: GoogleFonts.irishGrover().fontFamily,
                      shadows: const [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 5),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  const Text(
                    'Hello, Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Start your mindful journey today.Discover the power of the present moment and live with intention.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, 2))
                        ]),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onbordingScreen3-removebg-preview.png'))),
                  ),
                  ButtonClass(
                    cradius: 20,
                    height: 59,
                    width: 370,
                    text: 'GET STARTED ',
                    onpress: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavi(),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
