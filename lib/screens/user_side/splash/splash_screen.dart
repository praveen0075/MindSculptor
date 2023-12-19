import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_sculptor/screens/authentication/first_screen/first_screen.dart';
import 'package:mind_sculptor/constants/constv.dart';
import 'package:mind_sculptor/widgets/bottomnavigaiton/bottomnavigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.lightBlue, tc1],
          center: Alignment.center,
          radius: 1.4,
        )),
        child: Center(
            child: Text(
              'Mind Sculptor',
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 3,
                color: lg2,
                fontFamily: GoogleFonts.irishGrover().fontFamily,
                shadows: const [
                  Shadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 5),
                ],
              ),
            ),
          ),
        ),
    );
  }
  Future <void> checkUserLoggedin() async{
    final sharedpref = await SharedPreferences.getInstance();
    final userloggedIn =  sharedpref.getBool('userEntered');
    if(userloggedIn != null || userloggedIn == false){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavi(),));

    }else{
      // ignore: use_build_context_synchronously
     gotoLogin(context);
    }
  }
     Future<void> gotoLogin(context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => const FirstScreen(),));
  }
}
