import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/controller/constants/constv.dart';
import 'package:mind_sculptor/view/screens/authentication/logIn/log_in_screen.dart';
import 'package:mind_sculptor/view/screens/authentication/signIn/sign_in_screen.dart';
import 'package:mind_sculptor/view/widgets/buttons.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Mind Sculptor',
              style: TextStyle(
                fontSize: 30,
                color: lg1,
                fontFamily: GoogleFonts.irishGrover().fontFamily,
                shadows: const [
                  Shadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 470,
              child: Image.asset('assets/images/meditation_images.png'),
            ),
            Column(
              children: [
                const Text(
                  '"Lets begin your mindfulness adventure"\nSign up to explore',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonClass(
                  cradius: 20,
                  height: 59,
                  width: 370,
                  text: 'Sign Up',
                  onpress: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ALREADY HAVE AN ACCOUNT?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LogInScreen();
                          })),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
